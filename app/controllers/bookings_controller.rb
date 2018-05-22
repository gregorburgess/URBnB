class BookingsController < ApplicationController
  def create
    @booking = Booking.new()

    @booking.start_date = Date.strptime(params[:booking][:start_date], "%Y-%m-%d")
    @booking.end_date  = Date.strptime(params[:booking][:end_date], "%Y-%m-%d")
    @farm = Farm.find(params[:farm_id])
    @user = current_user
    @booking.total_price = ((@booking.end_date - @booking.start_date).to_i) * @farm.price
    @booking.user = @user
    @booking.farm = @farm
    if @booking.save
      redirect_to dashboard_path
    else
      render 'farms/show', date_start: Date.new(1900,1,1)
    end

  end

  def edit
    @booking = Booking.find(params[:id])
    render :edit
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)

  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.update(status: "Accepted")
    respond_to do |format|
        format.js  # <-- idem
      end
    end

    def decline
      @booking = Booking.find(params[:id])
      @booking.update(status: "Declined")
      respond_to do |format|
        format.js  # <-- idem
      end
    end

    def review
      @booking = Booking.find(params[:id])
    end

    private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date)
    end
  end
