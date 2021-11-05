class Gossip < ApplicationRecord
  belongs_to :user
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, length: {in: 3..14}
  validates :content, presence: true
end
