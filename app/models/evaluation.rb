class Evaluation < ApplicationRecord
  belongs_to :course
  has_and_belongs_to_many :students

  ##########VALIDACIONES

  validates :title, presence: true
  validates :amount, presence: true, numericality: {:greater_than_or_equal_to => 0}
  validates :min_score, presence: true, numericality: {:greater_than_or_equal_to => 0}
  validates :date, presence: true #Agregar un chequeo de fecha que corresponda segun el año de cursada.
  # ########################
end
