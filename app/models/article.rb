class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable

  delegate :email, to: :user, prefix: :user
end
