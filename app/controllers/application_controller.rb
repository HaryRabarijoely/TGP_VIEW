class ApplicationController < ActionController::Base
  include SessionsHelper
  include CommentLikesHelper
  include GossipLikesHelper

end
