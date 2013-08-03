class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
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

  private

  def image_params
    params.require(:image).permit(:source)
  end


end

