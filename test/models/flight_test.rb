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

  test 'the same route can happen day after day' do
    @flight2 = @flight
    @flight2.departure_date = 50.days.from_now
    assert @flight2.valid?
  end

end
