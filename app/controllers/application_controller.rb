class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(teacher)
    teacher_root_path(teacher)
  end
### como ya hice cagadas, pensar y trabajar sobre esto, para que en caso de que el docente sea admin, mostrar tambien funciones de admin.
# deberia haber hecho la clase usuario, y etc...
end
