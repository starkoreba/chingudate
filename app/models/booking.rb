class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  enum :status, { pending: 0, validate: 1, delete: 2 }
end
