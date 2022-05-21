class Timeslot < ApplicationRecord
  belongs_to :offer
  has_many :bookings, dependent: :destroy
  has_one :user, through: :offer
end
