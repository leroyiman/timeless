class ChatroomsController < ApplicationController

  # def index
  #   @chatrooms = Chatroom.all
  # end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @offer = Offer.find(params[:id])
    @chatroom = Chatroom.new
  end

  def create
    # @offer = Offer.find(params[:id])
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.user = current_user
    # @chatroom.offer = @offer.to_i
    # @chatroom.name = @offer.title
    # @chatroom.offeruser = @offer.user

    # @chatroom.user = current_user
    @chatroom.save

    redirect_to chatroom_path(@chatroom)
  end

  private

  def chatroom_params
    params.permit(:name, :offer_id)
  end
end
