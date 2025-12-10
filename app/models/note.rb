class Note < ApplicationRecord
  belongs_to :user
  has_many :note_tags
  has_many :attached_tags, through: :note_tags, source: :tag
end
