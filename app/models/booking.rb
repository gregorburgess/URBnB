class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :farm

  def approve
    status = "Accepted"
  end

  def declined
    status = "Declined"
  end
end
