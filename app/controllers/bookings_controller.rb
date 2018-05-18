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
    params.require(:booking).permit(:rating, :review, :start_date, :end_date)
  end
end
