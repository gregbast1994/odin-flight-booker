class Passenger < ApplicationRecord
    has_many :bookings
    validates :name, :age, presence: true
end
