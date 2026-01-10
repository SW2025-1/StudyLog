class Subject < ApplicationRecord
  has_many :logs
  has_many :notes
  
  belongs_to :user
end
