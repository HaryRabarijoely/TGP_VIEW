require 'test_helper'

class GossipLikesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get gossip_likes_create_url
    assert_response :success
  end

  test "should get new" do
    get gossip_likes_new_url
    assert_response :success
  end

  test "should get destroy" do
    get gossip_likes_destroy_url
    assert_response :success
  end

end
