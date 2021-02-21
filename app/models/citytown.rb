class Citytown < ApplicationRecord
  belongs_to :user
  has_many :schools, dependent: :destroy


  #PRESENTE
  validates :title,
            :slug,
             presence: true
  
  ################## VALIDATES  ###############
  validates :title, length: { maximum:50 }
  

  ################## SLUG ###############
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
  
end
