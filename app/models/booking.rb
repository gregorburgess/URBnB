class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :farm
  has_one :review

  validate :end_date_after_start_date?


  def approve
    status = "Accepted"
  end

  def declined
    status = "Declined"
  end

  def review_ready?
    status == "Accepted" && end_date <= Time.now
  end

  def end_date_after_start_date?
    if end_date < start_date
      errors.add :end_date, "must be after start date"
    end
  end

end
