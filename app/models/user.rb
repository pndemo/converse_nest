class User < ApplicationRecord
  has_secure_password

  has_many :posts, foreign_key: :created_by
  has_many :comments, foreign_key: :created_by

  validates_presence_of :name, :email, :password_digest
end
