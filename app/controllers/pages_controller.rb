class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user_info = current_user
    @user_ships = Ship.where(user: current_user)
    @user_bookings = Booking.where(user: current_user)
  end
end
