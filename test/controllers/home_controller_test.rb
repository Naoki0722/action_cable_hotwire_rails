require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "should get index" do
    sign_in users(:one)
    get root_path
    assert_response :success
  end

  test "authed redirect index" do
    sign_in users(:one)
    get new_user_session_path
    assert_response :redirect
    assert_redirected_to root_path
  end
end
