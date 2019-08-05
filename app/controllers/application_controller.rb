class ApplicationController < ActionController::Base
    before_action :make_search

    def make_search
        @airports = Airport.all
        @flights ||= Flight.where( departure_id: params[:from_code],
                                    arrival_id: params[:to_code],
                                    departure_date: params[:date] )
    end
end
