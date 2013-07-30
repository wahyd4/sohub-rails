class MessagesController < ApplicationController

  def show

  end

  def show_by_type
    type = params[:type]
    @messages = Message.where(message_type:type).order('created_at DESC')
    render json: @messages
  end
end
