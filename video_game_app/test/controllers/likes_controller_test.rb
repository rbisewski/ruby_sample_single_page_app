require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like = likes(:one)
  end

  test "should get index of like" do
    get likes_url
    assert_response :success
  end

  test "should POST to the like controller, adding a like" do
    post likes_url + "?game_id=255&name='fakename'&year=1970&manufacturer='fakecompany'&likes=11&ip='127.0.0.1'"
    assert_response :success
  end

end
