class Offer < ApplicationRecord
  # creator of the offer
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :picture
  validates :title, :description, presence: true
  validates :start_date, :end_date, presence: true
  validates :description, length: { minimum: 150 }
end
