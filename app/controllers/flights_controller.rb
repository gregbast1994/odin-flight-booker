class FlightsController < ApplicationController
    def index
        @flight_options =  Flight.find_each.map { |flight| [flight.arrival.country, flight.id] }
    end
end
