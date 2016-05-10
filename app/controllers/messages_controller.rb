class MessagesController < ApplicationController
  respond_to :json

  def create
    @message = Conversation.find(params[:conversation_id]).messages.build(message_params)
    @message.sender = current_user

    if @message.save
      render :show, status: :created, location: [@message.conversation, @message]
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
