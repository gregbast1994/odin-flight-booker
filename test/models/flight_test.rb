require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  def setup
    @flight = flights(:one)
  end

  test 'departure must be present' do
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
    @flight.arrival = @flight.departure
    assert_not @flight.valid?
  end

  test 'the arrival_time is the sum of departure_time + duration' do
    @flight.duration = 10
    @flight.save
    @flight.reload
    assert_not_equal @flight.departure_time, @flight.arrival_time
  end
end
