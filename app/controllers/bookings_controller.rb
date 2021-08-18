class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @ship = Ship.find(params[:ship_id])
    @booking.user = current_user
    @booking.ship = @ship

    authorize @booking

    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
    redirect_to root_path
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
