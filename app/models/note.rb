class Note < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  
  has_many :note_tags
  has_many :attached_tags, through: :note_tags, source: :tag
  
  has_many_attached :images
  
  has_rich_text :content
end
