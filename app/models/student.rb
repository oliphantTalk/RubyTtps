class Student < ApplicationRecord
  #has_and_belongs_to_many :evaluations
  has_many :course_students
  has_many :courses, through: :course_students
  has_many :evaluation_students
  has_many :evaluations, through: :evaluation_students



#  accepts_nested_attributes_for :courses

  before_save { self.email = email.downcase }


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: true
  validates :surname, presence: true
  validates :dni, presence: true, uniqueness: true, length: {minimum: 6, maximum: 10}
  validates :email, presence: true, format: {:with => VALID_EMAIL_REGEX,
                                             :message => 'El mail debe ser del tipo "ejemplo1234@abc.com"'},
                                            uniqueness: {case_sensitive: false}
  validates :legajo, presence: true, uniqueness: true
  validates_associated :courses

end
