class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :farm
  has_one :review

  def approve
    status = "Accepted"
  end

  def declined
    status = "Declined"
  end
end
