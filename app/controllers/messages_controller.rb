class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        {current_user: current_user.id, html: render_to_string(partial: "message", locals: { message: @message })}.to_json
        # render_to_string(partial: "message", locals: { message: @message })
      )
      head :ok
    else
      render "chatrooms/show"
    end
  end

  def show
    @message = Message.new
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id, :user_id)
  end
end
