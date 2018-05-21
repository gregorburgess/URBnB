class RemoveReviewsColumnToBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :review
    remove_column :bookings, :rating
  end
end
