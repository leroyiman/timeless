class Timeslot < ApplicationRecord
  belongs_to :offer
  has_many :bookings
  has_one :user, through: :offer
end
