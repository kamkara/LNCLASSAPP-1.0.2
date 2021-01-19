class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, authentication_keys: [:login]

  ##################  RELATIONS  ###################

  #has_many :courses, dependent: :destroy
  has_many :materials
  has_many :levels
  #has_many :exercices


end
