class Evaluation < ApplicationRecord
  belongs_to :course
  has_many :evaluation_students, dependent: :destroy
  has_many :students, through: :evaluation_students, dependent: :destroy

  validates :title, presence: true
  validates :min_score, presence: true, numericality: {:greater_than_or_equal_to => 0}
  validates :date, presence: true
  #Agregar un chequeo de fecha que corresponda segun el año de cursada.
end
