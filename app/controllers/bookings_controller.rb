class BookingsController < ApplicationController
  before_action :set_user, only: [:destroy, :create]
  before_action :set_super, only: [:new, :create]

  def new
    @bookings = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.super = @super
    if @booking.save
      redirect_to #(@booking)
     else
      render :new
    end
  end

  def destroy
    @booking = booking.find(params[:id])
    @booking.destroy
    redirect_to #
  end

  private
  
  def set_user
    @user = current_user
  end

  def set_super
    @super = Super.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user, :super)
  end
end
