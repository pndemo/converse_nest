class Comment < ApplicationRecord
  belongs_to :post

  validates_presence_of :content, :created_by
end
