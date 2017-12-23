class Course < ApplicationRecord
  belongs_to :subject
  has_many :course_students, dependent: :destroy
  has_many :students, through: :course_students
  has_and_belongs_to_many :teachers
  has_many :evaluations, dependent: :destroy

  accepts_nested_attributes_for :subject
  #ver validates_associated :clase_asociada
  validates :year, presence: true, numericality: true
  validates :number_of_evaluation, presence: true, numericality: true
end
