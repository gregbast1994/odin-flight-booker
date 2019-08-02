require 'test_helper'

class PassengerTest < ActiveSupport::TestCase
  def setup
    @passenger = passengers(:greg)
  end

  test 'passengers should have name' do
    @passenger.name = nil
    assert_not @passenger.valid?
  end

  test 'passengers should have age' do
    @passenger.age = nil
    assert_not @passenger.valid?
  end
end
