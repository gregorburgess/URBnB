class BookingsController < ApplicationController


  def edit
    @booking = Booking.find(params[:id])
    render :edit
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to dashboard_path
  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.update(status: "Accepted")
    @js = "GO"
   redirect_to dashboard_owner_path(anchor: "booking#{@booking.id}")
   raise
  end

  def declined
    @booking = Booking.find(params[:id])
    @booking.update(status: "Declined")
    redirect_to dashboard_owner_path(anchor: "booking#{@booking.id}")
  end

  private

  def booking_params
    params.require(:booking).permit(:rating, :review)
  end

end
