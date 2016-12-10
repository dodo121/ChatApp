class MessagesController < ApplicationController
  respond_to :json

  before_filter :find_conversation

  def create
    @message = @conversation.messages.build(message_params)
    @message.sender = current_user

    if @message.save
      render :show, status: :created, location: [@message.conversation, @message]
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def make_seen
    @conversation.messages.find(params[:message_id]).toggle!(:seen)
    render nothing: true
  end

  # def make_unseen
  #   @conversation.messages.find(params[:message_id]).update_attributes(seen: false)
  # end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def find_conversation
    @conversation = current_user.conversations.find(params[:conversation_id])
  end

end
