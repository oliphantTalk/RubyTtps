class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(teacher)
    teacher_root_path(teacher)
  end
### como ya hice cagadas, pensar y trabajar sobre esto, para que en caso de que el docente sea admin, mostrar tambien funciones de admin.
# deberia haber hecho la clase usuario, y etc...


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :username, :email, :password, :password_confirmation])

  end


end

