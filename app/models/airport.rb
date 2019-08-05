class Airport < ApplicationRecord
    has_many :arriving, class_name: 'Flight',
                        foreign_key: 'arrival_id'

    has_many :departing, class_name: 'Flight',
                        foreign_key: 'departure_id'

    validates :country, :code, presence: true


    def book(to, time)
        hours_in_flight = rand(24) + 1
        departing << Flight.new(arrival_id: to.id, departure_date: time,
                                duration: hours_in_flight)
    end
end
