class Flight < ApplicationRecord

  belongs_to :departure, class_name: 'Airport',
                          foreign_key: 'departure_id'

  belongs_to :arrival, class_name: 'Airport',
                          foreign_key: 'arrival_id'

  has_many :bookings
  
  validates :departure, :arrival, :duration, presence: true
  validate :departure_is_not_arrival

  scope :dates, -> { Flight.all.map {|x| x.departure_date }.uniq }

  def description
    "Departing from #{departure.country} on #{departure_date}. The flight should take approximately
     #{duration} hours. We will be arriving at #{arrival.name} in #{arrival.country}."
  end

  def departure_is_not_arrival
    if self.departure == self.arrival
      self.errors.add(:base, "You cannot fly to the same place you are departing.")
    end
  end
end
