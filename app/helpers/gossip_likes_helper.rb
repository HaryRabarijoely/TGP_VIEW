module GossipLikesHelper
  def nb_gossip_likes?(id)
    GossipLike.where(gossip_id: id).count
  end
  def is_gossip_liked?(gossip_id)
    GossipLike.where(gossip_id: gossip_id, user: current_user).count > 0
  end
end
