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
    @review.booking = Booking.find(params[:booking_id])
    @review.save!

  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
