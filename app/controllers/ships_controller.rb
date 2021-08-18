class ShipsController < ApplicationController
  before_action :set_ship, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @ships = policy_scope(Ship).order(created_at: :desc)
  end

  def show
    @ship = Ship.find(params[:id])
    @booking = Booking.new
    authorize @ship

    @markers =
      {
        lat: @ship.latitude,
        lng: @ship.longitude,
        info_window: render_to_string(partial: "info_window", locals: { ship: @ship })
      }
  end

  def new
    @ship = Ship.new
    authorize @ship
  end

  def create
    @ship = Ship.new(ship_params)
    @ship.user = current_user
    authorize @ship
    if @ship.save
      redirect_to ship_path(@ship)
    else
      render :new
    end
  end

  def edit
    authorize @ship
  end

  def update
    @ship.update(ship_params)
    redirect_to dashboard_path
    authorize @ship
  end

  def destroy
    @ship.destroy
    redirect_to dashboard_path
    authorize @ship
  end

  private

  def set_ship
    @ship = Ship.find(params[:id])
  end

  def ship_params
    params.require(:ship).permit(:user, :booking, :daily_price, :description, :name, :category, :address, :docking_number, :photo)
  end
end
