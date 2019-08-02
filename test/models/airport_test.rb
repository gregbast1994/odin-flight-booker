require 'test_helper'

class AirportTest < ActiveSupport::TestCase
  def setup
    @airport = airports(:DET)
  end

  test 'airport must have code' do
    @airport.code = nil
    assert_not @airport.valid?
  end

  test 'airport must have country' do
    @airport.country = nil
    assert_not @airport.valid?
  end
end
