class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render 'new'
    end
  end

  def show
  end

  private
  def booking_params
    params.require(:booking).permit(:flight, :passengers_attributes)
  end
end
