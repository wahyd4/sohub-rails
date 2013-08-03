class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params[:source])
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'image was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def show
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @image }
    end
  end


end

