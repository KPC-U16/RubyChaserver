require "test_helper"

class ServerControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get server_top_url
    assert_response :success
  end
end
