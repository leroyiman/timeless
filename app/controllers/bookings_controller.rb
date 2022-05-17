class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @timeslot = Timeslot.find(params[:timeslot_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @timeslot = Timeslot.find(params[:timeslot_id])
    @booking.timeslot = @timeslot
  end

  def is_confirmed
    if @booking.save
      true
    else
      false
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    # redirect_to
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :timeslot_id)
  end
end
