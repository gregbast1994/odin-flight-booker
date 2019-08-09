require 'test_helper'

class FlightSearchTest < ActionDispatch::IntegrationTest
  def setup
    @flight = flights(:one)
  end

  test 'should display available flights' do
    get root_url(from_code: @flight.departure_id, 
                to_code: @flight.arrival_id,
                date: @flight.departure_date,
                num_tickets: 2)
    assert_select 'tr.flight', minimum: 1
  end
end
