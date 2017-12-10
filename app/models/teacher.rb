class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :courses


################## VALIDATES
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true, uniqueness: true,
            format: { with: VALID_EMAIL_REGEX, :message => "Debe ser del tipo 'nombre@host.com'"}
  #validates :admin
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
##################################################
#
#


end
