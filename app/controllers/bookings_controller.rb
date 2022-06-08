class BookingsController < ApplicationController
  def initialize
    @is_confirmed == false
  end

  def index
    # Problems with the index routing. No Head and no Navbar when loading the page. Currently working through the pages#bookings Method and View!! :)
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

    if @booking.save!
      redirect_to offer_path(@offer), notice: "Your request has been sent. The owner will confirm your request within the next 24 hours"
    else
      raise
    end
  end

  #comment to delete

  def update
    @bookings = Booking.all
    @booking = Booking.find(params[:id])
    @user = User.find(@booking.user_id)
    @user_name = @user.fname
    @booking.update({ confirmed: params[:confirmed] })

      #commented CODE because each messeage cost money, this need to be discommented the day of demo

      if @booking.confirmed == "yes"
        TwilioClient.new.send_text("Hello #{@user_name}, Your booking for #{@booking.timeslot.offer.title} was confirmed, Chat with the Offer Owner for more details.")
      else
        TwilioClient.new.send_text("Hello #{@user_name}, Your booking for #{@booking.timeslot.offer.title}, check in wabisabi.lol new offers")
      end
    redirect_to profile_bookings_path, notice: "Booking Updated"
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
