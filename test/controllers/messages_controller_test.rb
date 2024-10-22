# frozen_string_literal: true

require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "should get new" do
    sign_in users(:one)
    get new_message_path
    assert_response :success
  end
end
