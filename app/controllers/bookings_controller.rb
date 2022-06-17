class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to car_path(@car), alert: 'Vous avez réservé'
    else
      redirect_to car_path(@car), alert: 'Une erreur est survenue lors de la réservation'
    end
  end

  def new
    @booking = Booking.new
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :car_id, :starts_at, :ends_at, :accepted)
  end
end
