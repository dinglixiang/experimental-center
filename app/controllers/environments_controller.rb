class EnvironmentsController < ApplicationController

	#设备一览
	def index
		@devices = Device.all
	end

	#场地一览
	def site_list
		@sites = Site.all
	end
end
