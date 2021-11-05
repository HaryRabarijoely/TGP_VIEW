class CommentLike < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  validates :user, presence: true
  validates :comment, presence: true
end
