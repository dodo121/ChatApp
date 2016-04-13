require 'test_helper'

class MessagesControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get messages_controller_create_url
    assert_response :success
  end

end
