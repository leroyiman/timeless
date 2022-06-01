class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]


  def index
    @user = current_user
    if params[:query].present?
      @offers = Offer.search_by_title(params[:query])
    else
      @offers = Offer.all
    end

    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window: render_to_string(partial: "info_window", locals: { offer: offer }),
        image_url: helpers.asset_url("purple.png")
      }
    end
  end

  def advance_offers
      @user = current_user
      if params[:query].present?
        @offers = Offer.where("title ILIKE ?", "%#{params[:title]}%")
      else
        @offers = Offer.all
      end

    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window: render_to_string(partial: "info_window", locals: { offer: offer }),
        image_url: helpers.asset_url("purple.png")
      }
    end
  end

  def show
    @offer = Offer.find(params[:id])
    @timeslot = @offer.timeslots
    @user = @offer.user
    @markers = [{
      lat: @offer.latitude,
      lng: @offer.longitude,
      # info_window: render_to_string(partial: "info_window", locals: { offer: @offer }),
      image_url: helpers.asset_url("purple.png")
    }]
    @booking = Booking.new
  end

  def new
    @offer = Offer.new
    5.times do
      @offer.timeslots.build
    end
  end

  def create
    @offer = Offer.new(offer_params)
    if current_user.nil?
      @offer.user = User.find(1)
    else
      @offer.user = current_user
    end
    if @offer.save

      redirect_to offers_path
    else
      render :new
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)

    redirect_to offer_path(@offer)
  end

  def destroy
    @offer = offer.find(params[:id])
    @offer.destroy
    redirect_to offers_path
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :location, :price, :category, :size, :color, :condition, :style, :material, :smoke_free, :pet_free, :receipt, photos: [], timeslots_attributes: [:timeslot])
  end
end


#just a random comment to delete please
