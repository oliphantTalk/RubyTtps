class Course < ApplicationRecord
  belongs_to :subject
  has_many :course_students
  has_many :students, through: :course_students
  has_and_belongs_to_many :teachers
  has_many :evaluations


  #ver validates_associated :clase_asociada
  validates :year, presence: true, numericality: true
####pensar si quiero limitar el numero de examenes que un curso puede tener.

end
