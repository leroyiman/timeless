class BookingsController < ApplicationController
  def initialize
    @is_confirmed == false
  end

  def index
    @bookings = Booking.where(user: current_user)
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

    if @booking.save
      redirect_to booking_path, notice: "Your request has been sent. The owner will confirm your request within the next 24 hours"
    else
      redirect_to offer_path, notice: "Request unsuccessful"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to bookings_path, notice: "Booking accepted"
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    # redirect_to
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :timeslot_id, :is_confirmed)
  end
end
