class Offer < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
  validates :start_date, :end_date, presence: true
  validates :description, length: { minimum: 150 }
end
