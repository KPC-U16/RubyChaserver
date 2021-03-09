require "test_helper"

class TokenControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get token_get_url
    assert_response :success
  end
end
