class ShipsController < ApplicationController
  before_action :set_ship, only: [:show, :edit, :update, :destroy]

  def index
    @ships = Ship.all
  end

  def show
  end

  def new
    @ship = Ship.new
  end

  def create
    @ship = Ship.new(ship_params)
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
    params.require(:ship).permit(:user, :booking, :daily_price)
  end
end
