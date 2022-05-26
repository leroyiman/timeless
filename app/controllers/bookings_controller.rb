class BookingsController < ApplicationController
  def initialize
    @is_confirmed == false
  end

  def index
    @bookings = Booking.where(user_id: current_user)
    # @bookings_as_owner = sort_by_created(@bookings.filter { |booking| booking.timeslot.offer.user == current_user })
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
    @timeslot = Timeslot.find(params[:timeslot_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = User.find(1)
    @offer = Offer.find(params[:offer_id])

    if @booking.save
      redirect_to offer_path(@offer), notice: "Your request has been sent. The owner will confirm your request within the next 24 hours"
    else
      raise
    end
  end

  def update
    @bookings = Booking.all
    @booking = Booking.find(params[:id])
    @booking.update({ confirmed: params[:confirmed] })

    redirect_to bookings_path, notice: "Booking accepted"
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    # redirect_to
  end

  private

  def booking_params
    params.require(:booking).permit(:timeslot_id, :confirmed)
  end

  # def sort_by_created(collection)
  #   collection.sort_by { |boo| boo.created_at }.reverse
  # end
end
