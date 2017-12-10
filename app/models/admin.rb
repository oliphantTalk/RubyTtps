class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save { self.email = email.downcase }

  validates :name, presence: true
  validates :surname, presence: true
  validates :username, presence: true
  validates :dni, presence:true, uniqueness: true, numericality: true


end
