class DevicesController < ApplicationController

	def index
		@devices = Device.all
	end

  def list
    @devices = Device.all
  end

end
