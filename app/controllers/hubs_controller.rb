class HubsController < ApplicationController

  def index
    @hubs = Hub.all
  end

  def new
    @hub = Hub.new
  end

  def create

  end

  def show
    @hub = Hub.find_by_id params[:id]
    render layout: 'hub.slim'
  end

end
