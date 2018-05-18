class BookingsController < ApplicationController


  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:rating, :review)
  end

end
