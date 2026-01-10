class Tag < ApplicationRecord
  belongs_to :user
  has_many :note_tags, dependent: :destroy
  has_many :tagged_notes, through: :note_tags, source: :note
end
