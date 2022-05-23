class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :timeslot
  after_create :notify_offer_user
  def offer_user
    timeslot.offer.user
  end

  def notify_offer_user
    # send message to the offer_user (text of the message)
  end
end
