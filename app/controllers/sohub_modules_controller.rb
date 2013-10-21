class SohubModulesController < ApplicationController

  def index
    @sohub_modules = SohubModule.all
  end

end
