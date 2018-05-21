class AddReviewToBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :review
    remove_column :bookings, :rating
    add_reference :bookings, :review, foreign_key: true
  end
end
