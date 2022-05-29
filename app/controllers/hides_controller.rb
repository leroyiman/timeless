class HidesController < ApplicationController

  def new
    @offer = Offer.find(params[:offer_id])
    @hide = Hide.new
    @hide.user_id = current_user.id
    @hide.offer_id = @offer.id
    @hide.is_hide = true
    @hide.save
    redirect_to offers_path
  end

end
