class BookingsController < ApplicationController
  # before_action :set_user, only: [:destroy, :create]
  before_action :set_super, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(super_id: params[:super_id].to_i)
    @booking.user = current_user
    if @booking.save
      redirect_to user_path(current_user)
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

  def set_super
    @super = Super.find(params[:super_id])
  end

end
