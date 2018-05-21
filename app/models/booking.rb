class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :farm

  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }

  def approve
    status = "Accepted"
  end

  def declined
    status = "Declined"
  end
end
