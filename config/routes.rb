Rails.application.routes.draw do
  get '/teachers' => 'teachers#index', as: :teacher_root # creates user_root_path
  get 'teachers/:id/miscursos' => 'teachers#my_courses', as: :my_courses
  get 'evaluation/:evaluation_id/students/:id/new' => 'students#add_student_to_evaluation', as: :new_evaluation_add_student
  get 'evaluation/:evaluation_id/students' => 'students#index_evaluation_students', :as => :index_evaluation_students
  get 'evaluations/:evaluation_id/students/calificate' => 'students#edit_evaluation_students', :as => :edit_evaluation_students
  patch 'evaluations/:evaluation_id/student/:student_id/update' => 'students#update_calification', :as => :update_evaluation_student
  devise_for :teachers

  resources :evaluations do
    resources :students, except: :create
  end

  resources :students
  resources :subjects

  resources :courses do
    resources :students
    resources :teachers
    resources :evaluations
  end

  resources :subjects do
    resources :courses
  end

  resources :teachers do
    resources :courses
  end




end
