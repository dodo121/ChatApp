class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.conversation = Conversation.find(params[:conversation_id])

    if @message.save
      format.json { render :show, status: :created, location: [@message.conversation, @message]  }
    else
      format.json { render json: @message.errors, status: :unprocessable_entity }
    end
    respond_to :json
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
