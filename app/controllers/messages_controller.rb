class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.room = Room.find(params[:room_id])

    respond_to do |format|
      if @message.save
        format.json { render :show, status: :created, location: [@message.room, @message]  }
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
