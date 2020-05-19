class BookingsController < ApplicationController
  @user == current.user
  @super == current.superhero

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

  def destroy
    @booking = booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:user, :super)
  end
end
