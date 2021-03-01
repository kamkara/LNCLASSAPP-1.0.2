class Exercice < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_rich_text :content
  
  #Avoid N+1 queries
  Exercice.all.with_rich_text_content # Preload the body without attachments.
  Exercice.all.with_rich_text_content_and_embeds # Preload both body and attachments.
  


  #SLUG
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
