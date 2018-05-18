class DashboardController < ApplicationController

  def index
    @booking_guest = Booking.where(user: current_user)
    @booking_owner = Booking.joins(:farm).where(:farms => {:user => current_user})
  end

  def index_owner
    @booking_guest = Booking.where(user: current_user)
    @booking_owner = Booking.joins(:farm).where(:farms => {:user => current_user})
    @owner = true
    render :index
  end
end
