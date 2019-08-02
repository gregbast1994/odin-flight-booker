class Flight < ApplicationRecord
  after_create :set_arrival_time

  belongs_to :departure, class_name: 'Airport',
                          foreign_key: 'departure_id'

  belongs_to :arrival, class_name: 'Airport',
                          foreign_key: 'arrival_id'

  validates :departure, :arrival, :duration, presence: true
  validates :departure, :arrival, uniqueness: true 

  private
  def set_arrival_time
    arrival_time = departure_time + duration.hours
    update_attribute( :arrival_time, arrival_time )
  end
end
