class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:trackable, authentication_keys: [:login]

  ##################  RELATIONS  ###################

  #has_many :courses, dependent: :destroy
  has_many :materials
  has_many :levels
  #has_many :exercices

  ################  VALIDATIONS  ###########################

  ########### UNIQUENESS  ######
    validates :matricule, :email, uniqueness: true

  ######### PRESENTES && FORMAT  ######
    validates :phone_contact,
              :city, :school_name,
              :email, :city, presence: true

    validates :last_name, :first_name,
              presence: true,
              length: { maximum: 30 },
              format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }

    validates :phone_contact, :whatsapp_contact,
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




################  CONSTANTE   ###########################
CLASSROOM   = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
SCHOOL_NAME = ["LYCEE MODERNE TIASSALE", "COLLEGE SAINT MICHEL TIASSALE", "COLLEGE PRIVE MIXTE UNION TIASSALE", "COLLÈGE NOTRE DAME DE LA PAIX TIASSALE", "COLLÈGE PRIVE LA MANNE", "Autres villes"]
CITY        = [ "Tiassalé", "N'Douci", "Agboville", "Divo", "Autres villes"]
ROLE        = ["student", "teacher", "Admin"]


################  SIGN IN PHONE NUMBR OR EMAIL  ###########################

  attr_writer :login

  def login
    @login || self.phone_contact || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(phone_contact) = :value OR lower(email) = :value", { :value => login }]).first
      elsif conditions.has_key?(:contact_phone) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
  end


end
