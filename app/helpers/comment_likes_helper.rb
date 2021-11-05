module CommentLikesHelper
  def nb_comment_likes?(id)
    CommentLike.where(comment_id: id).count
  end
  def is_comment_liked?(comment_id)
    CommentLike.where(comment_id: comment_id, user: current_user).count > 0
  end
end
