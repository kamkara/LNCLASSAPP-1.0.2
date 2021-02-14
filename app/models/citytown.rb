class Citytown < ApplicationRecord
  belongs_to :user

   ################## VALIDATES  ###############
  validates :title,:slug, presence: true,
                          length: { maximum:100 }
  #SLUG
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
