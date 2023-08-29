class MessagesController < ApplicationController
  def create
    @challenge = Challenge.find(params[:challenge_id])
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    authorize @message
    if @message.save!
      ChatroomChannel.broadcast_to(
        @chatroom,
        {message_id: @message.id, sender_id: current_user.id, content: render_to_string(partial: "message0", locals: { message: @message })}
      )
      redirect_to challenge_chatroom_path(@challenge, @chatroom, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
