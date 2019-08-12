require 'test_helper'

class BookFlightTest < ActionDispatch::IntegrationTest
  def setup
    @flight = flights(:one)
  end

  test 'should create the booking object as well as passengers' do
    num_tickets = 2
    # a hackish way to test that the form is generating properly
    # 2 inputs for each passengers (4) + 6 from nav, hidden input and submit button
    num_input = (num_tickets * 2) + 6
    get new_booking_path(flight: @flight.id, num_tickets: num_tickets)
    assert_select 'input#booking_flight_id', 1
    assert_select 'input', num_input
    assert_difference 'Booking.count' do
      assert_difference 'Passenger.count', num_tickets do
        params = { booking: { flight_id: @flight.id,
                              passengers_attributes: [ { name: 'greg', age: 21 },
                                                       { name: 'adina', age: 25} ] } }
        post bookings_path( params )
      end
    end
    @booking = assigns(:booking)
    assert_redirected_to @booking
  end
end
