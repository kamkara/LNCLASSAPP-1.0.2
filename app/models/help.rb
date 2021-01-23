class Help < ApplicationRecord
  belongs_to :material
  belongs_to :user
  has_rich_text :content

  #Avoid N+1 queries
  Help.all.with_rich_text_content # Preload the body without attachments.
  Help.all.with_rich_text_content_and_embeds # Preload both body and attachments.

  #PRESENTE
  validates :title,
            :content,
            :slug,
            :author,
            :material_id,
             presence: true
  
  ################## VALIDATES  ###############
  validates :content, length: { minimum:100 }
  #SLUG
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
