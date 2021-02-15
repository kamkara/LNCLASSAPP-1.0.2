class School < ApplicationRecord
  belongs_to :citytown
  belongs_to :user

    ################## VALIDATES  ###############
  validates :title, :sigle, :slug, presence: true,
                          length: { maximum:100 }
  
                          




  extend FriendlyId
    friendly_id :sigle, use: :slugged

  def should_generate_new_friendly_id?
    sigle_changed?
  end
end
