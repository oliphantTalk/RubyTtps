Rails.application.routes.draw do
  get '/teachers' => 'teachers#index', as: :teacher_root # creates user_root_path
  get 'teachers/:id/miscursos' => 'teachers#my_courses', as: :my_courses

  devise_for :teachers
  resources :evaluations
  resources :students
  resources :subjects
  resources :admins

  resources :courses do
    resources :students
    resources :teachers

  end

  resources :subjects do
    resources :courses
  end

  resources :teachers do
    resources :courses
  end




end
