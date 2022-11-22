class Booking < ApplicationRecord
  # creator of booking
  belongs_to :user
  belongs_to :offer

  enum :status, { pending: 0, validated: 1, canceled: 2 }
end
