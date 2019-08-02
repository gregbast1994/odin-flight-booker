require 'test_helper'

class AirportControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get airport_path(airports(:DET))
    assert_response :success
  end

end
