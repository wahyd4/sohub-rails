class MessagesController < ApplicationController

  def show

  end

  def show_by_type
    type = params[:type]
    @messages = Message.where(message_type: type).order('created_at DESC')
    render json: @messages.to_json(include: {user: {only: [:avatar, :display_name]}})
  end
end
