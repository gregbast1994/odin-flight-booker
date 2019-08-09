class BookingsController < ApplicationController
  def new
    if params[:flight] && params[:num_tickets]
      @ticket_num = params[:num_tickets].to_i
      @ticket_num.times { Passenger.new }
      @flight = Flight.find_by(id: params[:flight])
      @booking = @flight.bookings.build
    end
  end

  def create
    @flight = Flight.find(params[:booking][:flight_id])
    raise
    @booking = @flight.bookings.build(booking_params)
    if @booking&.save
       redirect_to @booking
    else 
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @passengers = @booking.passengers
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, :passengers_attributes)
  end

end
