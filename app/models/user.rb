class User < ApplicationRecord
  has_secure_password
  has_many :notes
  has_many :logs
  has_many :tags
  has_many :subjects
end
