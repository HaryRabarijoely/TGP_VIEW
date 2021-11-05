class GossipLikesController < ApplicationController
  before_action :find_gossip


  def create
    if GossipLike.create(user_id: current_user.id,gossip_id: params[:id] )
      flash[:success] = "You successfuly Liked the gossip !"
      redirect_to :controller => 'gossips', :action => 'show', :id => @gossip.id
    else
      flash[:danger] = "Error with the like!"
      redirect_to :controller => 'gossips', :action => 'show', :id => @gossip.id
    end
  end

  def destroy
    if !(already_liked?)
      flash[:danger] = "Cannot unlike"
    else
      GossipLike.destroy(@id)
      flash[:success] = "You successfuly Unliked the gossip !"
    end
    redirect_to :controller => 'gossips', :action => 'show', :id => @gossip.id
  end

  private

  def find_gossip
    @gossip = Gossip.find(params[:id])
  end

  def already_liked?
    @like = GossipLike.where(user_id: current_user.id, gossip_id: params[:id])
    @id = @like.first.id
    !@like.nil?
  end

end
