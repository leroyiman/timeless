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
    @bookings = Booking.where(user_id: current_user)
    @newbookings = @bookings.where(confirmed: nil)
    @confirmbookings = @bookings.where(confirmed: "yes")
    @declinebookings = @bookings.where(confirmed: "no")
  end

  def carousel

  end

end
