class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    @user = current_user
  end

  def profile_user
    @user = User.find(params[:id])
  end

  def advance
  end

  def bookings
    @offers = Offer.where(user_id: current_user)
    @timeslots = Timeslot.where(offer_id: @offers)
    @bookings = Booking.where(timeslot_id: @timeslots)
    @newbookings = @bookings.where(confirmed: nil)
    @confirmbookings = @bookings.where(confirmed: "yes")
    @declinebookings = @bookings.where(confirmed: "no")
  end

  def carousel
  end

end
