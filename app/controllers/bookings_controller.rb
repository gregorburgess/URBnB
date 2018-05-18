class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @farm = Farm.find(params[:farm_id])
    @user = current_user
    @total_price = ((@booking.end_date - @booking.start_date).to_i) * @farm.price

    @booking.user = @user
    @booking.farm = @farm
    if @booking.save
      redirect_to dashboard_path
    else
      render 'farm/show'
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
