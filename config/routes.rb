Rails.application.routes.draw do
  get '/teachers' => 'teachers#index', as: :teacher_root # creates user_root_path
  get '/admins' => 'admins#index', as: :admin_root # creates user_root_path
  get 'teachers/:id/miscursos' => 'teachers#my_courses', as: :my_courses

  devise_for :admins
  devise_for :teachers
  resources :evaluations
  resources :students
  resources :courses
  resources :subjects
  resources :admins
  resources :teachers do
    resources :courses
  end



end
