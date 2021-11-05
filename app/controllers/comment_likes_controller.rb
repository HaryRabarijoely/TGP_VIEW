class CommentLikesController < ApplicationController
  before_action :find_comment


  def create
    if CommentLike.create(user_id: current_user.id,comment_id: params[:id] )
      flash[:success] = "You successfuly Liked the comment !"
      redirect_to :controller => 'gossips', :action => 'show', :id => @comment.gossip.id
    else
      flash[:danger] = "Error with the like!"
      redirect_to :controller => 'gossips', :action => 'show', :id => @comment.gossip.id
    end
  end

  def destroy
    if !(already_liked?)
      flash[:danger] = "Cannot unlike"
    else
      CommentLike.destroy(@id)
      flash[:success] = "You successfuly Unliked the comment !"
    end
    redirect_to :controller => 'gossips', :action => 'show', :id => @comment.gossip.id
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def already_liked?
    @like = CommentLike.where(user_id: current_user.id, comment_id: params[:id])
    @id = @like.first.id
    !@like.nil?
  end

end
