class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.joins(:offer).where(user_id: current_user.id).or(Chatroom.joins(:offer).where(offer: {user_id: current_user.id}))
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @offer = Offer.find(params[:id])
    @chatroom = Chatroom.new
  end

  def create
    if chatroom = Chatroom.find_by(user_id: current_user.id, offer_id: params[:offer_id])
      return redirect_to chatroom_path(chatroom)
    end

    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.user = current_user
    @chatroom.save
    redirect_to chatroom_path(@chatroom)
  end

  private

  def chatroom_params
    params.permit(:name, :offer_id)
  end
end
