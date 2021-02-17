class Comment < ApplicationRecord
  belongs_to :user
  has_many :comments, class_name: 'Comment', as: :commentable

  belongs_to :commentable, polymorphic: true

  delegate :email, to: :user, prefix: :user


end
