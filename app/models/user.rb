class User < ApplicationRecord
  has_secure_password

  has_many :documents
  validates_uniqueness_of :username
end
