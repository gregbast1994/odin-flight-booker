require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  def setup
    @flight = flights(:one)
  end

  test 'departure must be present' do
    assert @flight.valid?
    @flight.departure = nil
    assert_not @flight.valid?
  end

  test 'arrival must be present' do
    @flight.arrival = nil
    assert_not @flight.valid?
  end

  test 'duration must be present' do
    @flight.duration = nil
    assert_not @flight.valid?
  end

  test 'the destination cannot be the departure' do
    @new_flight = Flight.new( departure: Airport.first, arrival: Airport.first,
                              departure_date: Date.new, duration: 5)
    assert_not @new_flight.valid?
  end

end
