require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_booking_path
    assert_response :success
  end

  test "should get show" do
    get booking_path(1)
    assert_response :success
  end

end
