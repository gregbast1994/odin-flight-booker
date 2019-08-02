class AirportsController < ApplicationController
  def index
    @airports = Airport.all
  end
  
  def show
  end
end
