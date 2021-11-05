class GossipLike < ApplicationRecord
  belongs_to :gossip
  belongs_to :user
  validates :user, presence: true
  validates :gossip, presence: true
end
