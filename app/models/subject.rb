class Subject < ApplicationRecord


  has_many :courses

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :year, presence: true, numericality: true
  validates :detail, presence: true

end
