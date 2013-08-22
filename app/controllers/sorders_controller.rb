#encoding:utf-8
class SordersController < ApplicationController

  def index
    @sorders = Sorder.all
  end

  def show
    @sorder = Sorder.find(params[:id])
  end

  def new
    @sorder = Sorder.new
    @site = Site.find(params[:site_id]) if params[:site_id]
    session[:site_id] = params[:site_id]
   # render json: session[:site_id]
  end

  def create
    @sorder = Sorder.new(params[:sorder])
    @sorder.opinion = "未审核"
    @sorder.site_id = session[:site_id]
    session[:site_id]=nil
    if @sorder.save
      redirect_to sites_path
    else
      render :new
    end
  end
end
