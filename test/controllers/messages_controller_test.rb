# frozen_string_literal: true

require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "should get new" do
    sign_in users(:one)
    get new_room_message_path(rooms(:one).id)
    assert_response :success
  end
end
