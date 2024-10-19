require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "should get index" do
    sign_in users(:one)
    get rooms_path
    assert_response :success
  end

  test "should get show" do
    sign_in users(:one)
    get room_path(rooms(:one).id)
    assert_response :success
  end
end
