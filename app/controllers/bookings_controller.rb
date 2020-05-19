class BookingsController < ApplicationController
  def new
    @bookings = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
     else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user, :super)
  end
end
