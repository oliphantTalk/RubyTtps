class Course < ApplicationRecord
  belongs_to :subject
  has_and_belongs_to_many :students
  has_and_belongs_to_many :teachers
  has_many :evaluations

  #ver validates_associated :clase_asociada
  validates :year, presence: true, numericality: true
end
