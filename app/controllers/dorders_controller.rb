class DordersController < ApplicationController
  def index
  end

  def new
    @dorder = Dorder.new
  end
  def create
    @dorder = Dorder.new(params[:dorder])
    if @dorder.save 
      redirect_to devices_path
    else
      render :new
    end
  end
end
