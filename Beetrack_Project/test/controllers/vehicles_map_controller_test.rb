require 'test_helper'

class VehiclesMapControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get vehicles_map_show_url
    assert_response :success
  end

end
