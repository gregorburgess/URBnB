class Farm < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true,  numericality: { greater_than_or_equal_to: 0 }
  validates :user, presence: true
  validates :photo, presence: true

end
