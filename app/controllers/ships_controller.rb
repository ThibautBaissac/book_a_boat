class ShipsController < ApplicationController
  before_action :set_ship, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @ships = Ship.all
    @ships = policy_scope(Ship).order(created_at: :desc)
  end

  def show

    @ship = Ship.find(params[:id])
    @booking = Booking.new
    authorize @ship
  end

  def new
    @ship = Ship.new
  end

  def create
    @ship = Ship.new(ship_params)
    authorize @ship

    if @ship.save!
      redirect_to ship_path(@ship)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @ship.update(ship_params)
    redirect_to ship_path(@ship)
  end

  def destroy
    @ship.destroy
    redirect_to ships_path
  end

  private

  def set_ship
    @ship = Ship.find(params[:id])
  end

  def ship_params
    params.require(:ship).permit(:user, :booking, :daily_price, :description)
  end
end
