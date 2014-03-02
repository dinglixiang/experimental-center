#encoding:utf-8
class SordersController < ApplicationController

  def index
    @sorders = Sorder.page(params[:page]).per(14)
  end

  def show
    @sorder = Sorder.find(params[:id])
  end

  def new
    @sorder = Sorder.new
    @site = Site.find(params[:site_id]) if params[:site_id]
    session[:site_id] = params[:site_id]
  end

  def create
    @site = Site.find(session[:site_id])
    @sorder = Sorder.new(params[:sorder])
    @sorder.opinion = "未审核"
    session[:site_id]=nil
    if @sorder.save
      redirect_to sites_path
    else
      render :new
    end
  end
end
