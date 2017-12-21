class CourseStudent < ApplicationRecord
  belongs_to :course
  belongs_to :student
  #creado como modelo aparte con la intencion de
  # persistir si el alumno aprobo o no la cursada.
end
