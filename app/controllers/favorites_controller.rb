class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user)
  end

  def new
    @offer = Offer.find(params[:offer_id])
    @favorite = Favorite.new
    @favorite.user_id = current_user.id
    @favorite.offer_id = @offer.id
    @favorite.is_favorite = true
    @favorite.save
    redirect_to offer_path(params[:offer_id])

  end

  def destroy
    @offer = Offer.find(params[:offer_id])
    @user = current_user.id
    @favorite = Favorite.where(user_id: @user, offer_id: @offer)
    @favorite.last.destroy
    redirect_to offer_path(params[:offer_id])
  end
end


# @offer = Offer.find(params[:offer_id])
# @hidden = Hidden.new
# @hidden.user_id = current_user.id
# @hidden.offer_id = @offer.id
# @hidden.is_hidden = true
# @hidden.save
# redirect_to offers_path
