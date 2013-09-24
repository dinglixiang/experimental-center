class DordersController < ApplicationController
  def index
    @dorders = Dorder.all
  end

  def show
    @dorder = Dorder.find(params[:id])
  end

  def new
    @dorder = Dorder.new
    @device = Device.find(params[:device_id]) if params[:device_id]
    #render json: @device 
    session[:device_id]=params[:device_id]
  end

  def create
    @dorder = Dorder.new(params[:dorder])
    @dorder.opinion ="未审核" 
    @dorder.device_id=session[:device_id]
    render json: @dorder
    session[:device_id]=nil
    if @dorder.save 
     # redirect_to devices_path,:notice => "success!"
    else
      #render :new
    end
  end
end
