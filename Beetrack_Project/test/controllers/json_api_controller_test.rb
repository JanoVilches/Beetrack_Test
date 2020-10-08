require 'test_helper'

class JsonApiControllerTest < ActionDispatch::IntegrationTest
  test "should get new_waypoint" do
    get json_api_new_waypoint_url
    assert_response :success
  end

end
