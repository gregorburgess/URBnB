class AddDefaultValueToStatusInBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :status, :string, default: "Pending"
    change_column :bookings, :rating, :integer, default: 0
  end
end
