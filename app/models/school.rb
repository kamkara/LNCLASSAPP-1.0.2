class School < ApplicationRecord
  belongs_to :citytown
  belongs_to :user
  
  ################## SCHOOL TYPE  ###############
  SCHOOL_TYPE= ['Privé', 'Public', 'Mixte']
  SCHOOL_TYPE= ['S', 'M', 'L'] # S: Small {-500};  M: Medium { +500-1.5k}; L: Large {+1.5K}


  ################## VALIDATES  ###############
  validates :title, :slug, presence: true
  validates :title, length: { maximum:100 }
  #SLUG
  extend FriendlyId
    friendly_id :sigle, use: :slugged

  def should_generate_new_friendly_id?
    sigle_changed?
  end
end
