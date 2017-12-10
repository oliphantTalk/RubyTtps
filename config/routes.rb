Rails.application.routes.draw do
  devise_for :admins
  devise_for :teachers
  resources :evaluations
  resources :students
  resources :courses
  resources :subjects
  resources :admins
  resources :teachers

  get '/teachers' => 'teachers#index', as: :teacher_root # creates user_root_path
  get '/admins' => 'admins#index', as: :admin_root # creates user_root_path



end
