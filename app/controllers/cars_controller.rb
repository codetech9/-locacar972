class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    set_car
    @booking = Booking.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to car_path(@car)
   else
    render :new
   end
  end

  def edit
  end

  def update
    @car = Car.update(car_params)
    redirect_to cars_path(@car)
  end

  def destroy
    @car = Car.find(params[:id])
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:brand, :model, :year_of_production, :address, :price_per_day)
  end
end
