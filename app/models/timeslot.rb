class Timeslot < ApplicationRecord
  belongs_to :offer
  has_many :bookings
end
