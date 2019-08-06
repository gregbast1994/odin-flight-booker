class Flight < ApplicationRecord

  belongs_to :departure, class_name: 'Airport',
                          foreign_key: 'departure_id'

  belongs_to :arrival, class_name: 'Airport',
                          foreign_key: 'arrival_id'

  has_many :bookings
  
  validates :departure, :arrival, :duration, presence: true

  scope :dates, -> { Flight.all.map {|x| x.departure_date }.uniq }
end
