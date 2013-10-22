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

  def my_list
    @hubs = @current_user.hubs
    render :my_list
  end

  def edit
    @sohub_modules = SohubModule.all
    @my_modules = @current_user.sohub_modules
  end

end
