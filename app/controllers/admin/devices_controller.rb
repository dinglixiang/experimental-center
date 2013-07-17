#encoding:utf-8

module Admin 
	class DevicesController < AdminController

		def index
			@devices = Device.all
		end

		def show
			@device = Device.find(params[:id])
		end

		def new
			@device = Device.new
		end

		def edit
			@device = Device.find(params[:id])
		end

		def create
			@device = Device.new(params[:device])
			if @device.save
				redirect_to admin_devices_path,:notice => "设备添加成功!"
			else
				render :new
			end
		end	

		def update
			@device = Device.find(params[:id])
			if @device.update_attributes(params[:device])
				redirect_to admin_devices_path,:notice => "更新成功!"
			else
				render :edit
			end
		end

		def destroy
			@device = Device.find(params[:id])
			if @device.delete
				redirect_to admin_devices_path,:notice => "删除成功!"
			else
				redirect_to admin_devices_path,:notice => "删除失败!"
			end
		end
	end
end