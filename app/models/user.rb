class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  ##################  RELATIONS  ###################

  #has_many :courses, dependent: :destroy
  has_many :materials
  has_many :levels
  #has_many :exercices

  ################  VALIDATIONS  ###########################

  ########### UNIQUENESS  ######
    validates :matricule, :email, uniqueness: true

  ######### PRESENTES && FORMAT  ######
    validates :contact_phone,
              :city, :school_name,
              :email, :city, presence: true

    validates :last_name, :first_name,
              presence: true,
              length: { maximum: 30 },
              format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }

    validates :contact_phone, :contact_whatsapp,
              length: { in: 8..12 }, uniqueness: true


################ NOT IMPLENETED  ###########################
  #validates :gender, presence: true
  #Birthday
   #validates :birthday, presence: true

  #enum user_gender: [:female, :male ], _default: :male

#enum user role
# define rails enum and the underlying values to use for every enum-value
#enum user_role: [:student, :teacher, :admin, :team, :support], default: :student

#enum roles: [:student, :teacher, :admin], _default: :student
################  CUSTOM ACTIONS  ###########################

def full_name
  self.full_name = "#{self.first_name} #{self.last_name}"
end

def user_slug
  self.slug = self.full_name
end

################  BEFORE ACTIONS  ###########################
#Delete whitespaces before and after fields, DownCase and capitalize
before_save do
  self.contact_phone      = contact_phone.strip.squeeze(" ")
  self.contact_whatsapp   = contact_whatsapp.strip.squeeze(" ")
  self.first_name         = first_name.strip.squeeze(" ").downcase.capitalize
  self.last_name          = last_name.strip.squeeze(" ").downcase.capitalize
  self.city               = city.strip.squeeze(" ").downcase.capitalize
  self.school_name        = school_name.strip.squeeze(" ").downcase.capitalize
  self.full_name          = self.full_name.strip.squeezz(" ").downcase.capitalize
  
end

################  SLUG   ###########################

  #SLUG
  extend FriendlyId
    friendly_id :user_slug , use: :slugged

  def should_generate_new_friendly_id?
      user_slug_changed?
  end


################  CONSTANTE   ###########################
CLASSROOM   = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
SCHOOL_NAME = ["LYCEE MODERNE TIASSALE", "COLLEGE SAINT MICHEL TIASSALE", "COLLEGE PRIVE MIXTE UNION TIASSALE", "COLLÈGE NOTRE DAME DE LA PAIX TIASSALE", "COLLÈGE PRIVE LA MANNE", "Autres villes"]
CITY        = [ "Tiassalé", "N'Douci", "Agboville", "Divo", "Autres villes"]
ROLE        = ["student", "teacher", "Admin"]


################  SIGN IN PHONE NUMBR OR EMAIL  ###########################

  attr_writer :login

  def login
    @login || self.contact_phone || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(contact_phone) = :value OR lower(email) = :value", { :value => login }]).first
      elsif conditions.has_key?(:contact_phone) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
  end


end
