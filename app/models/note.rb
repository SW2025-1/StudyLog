class Note < ApplicationRecord
  belongs_to :user
  belongs_to :subject, optional: true
  
  has_many :note_tags
  has_many :attached_tags, through: :note_tags, source: :tag
  has_rich_text :body
end
