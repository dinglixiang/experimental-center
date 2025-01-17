class DevicesController < ApplicationController

  def index
	@devices = Device.page(params[:page]).per(6)
  end

  def list
    @devices = Device.page(params[:page]).per(10)
  end

  def download
  	send_file 'public/downloads/#{params[:download_type]}.pdf'
  	#redirect_to :back
  end
end
