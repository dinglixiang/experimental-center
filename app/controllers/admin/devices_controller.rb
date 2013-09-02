#encoding:utf-8

module Admin 
	class DevicesController < AdminController
		before_filter :find_device, only: [:show,:edit,:update,:delete]


		def index
			@devices = Device.all
		end

		def show
		end

		def new
			@device = Device.new
		end

		def edit
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
			if @device.update_attributes(params[:device])
				redirect_to admin_devices_path,:notice => "更新成功!"
			else
				render :edit
			end
		end

		def destroy
			if @device.delete
				redirect_to admin_devices_path,:notice => "删除成功!"
			else
				redirect_to admin_devices_path,:notice => "删除失败!"
			end
		end

		private
		def find_device
			@device = Device.find(params[:id])
		end

	end
end