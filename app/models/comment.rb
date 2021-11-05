class Comment < ApplicationRecord
  belongs_to :gossip, optional: true
  belongs_to :commentable, polymorphic: true, optional: true, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  validates :content, presence: true
end
