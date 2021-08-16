class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @ship = Ship.find(params[:ship_id])
    @booking.user = current_user
    @booking.ship = @ship
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
