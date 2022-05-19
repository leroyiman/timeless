class TimeslotsController < ApplicationController
  # def index
  #   @timeslot = timeslot.find(params[:id])
  #   @timeslots = Timeslot.find(timeslot_id: @timeslot.id)
  # end

  # def show
  #   @timeslot = timeslot.find(params[:id])
  # end

  def new
    @timeslot = Timeslot.new

  end

  def create
    @offer = Offer.find(params[:offer_id])
    @timeslot = Timeslot.new(timeslot_params)
    @timeslot.offer = @offer
    @timeslot.save

    redirect_to offer_path(@offer)

  end

  def destroy
    @timeslot = Timeslot.find(params[:id])
    @timeslot.destroy
    redirect_to offer_path(@timeslot.offer)
  end


  private

  def timeslot_params
    params.require(:timeslot).permit(:timeslot)
  end
end
