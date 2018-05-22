class ReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new()
  end

  def edit
    @review =  Review.find(params[:id])

  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking =  @booking
    if @review.save
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
