class MessagesController < ApplicationController

  def show

  end

  def show_by_type
    type = params[:type]
    hub = Hub.find_by_id params[:hub]
    un_filtered_messages = Message.where(message_type: type)
    if hub
      @messages = Message.reverted.where('message_type= ? and hub_id = ?', type, hub.id).limit(20)
    else
      @messages =un_filtered_messages.reverted.limit(20)
    end
    render json: @messages.to_json(include: {user: {only: [:avatar, :display_name]}})
  end
end
