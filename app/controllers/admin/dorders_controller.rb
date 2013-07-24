#encoding:utf-8

module Admin 
	class DordersController < AdminController

		def index
			@dorders = Dorder.all
		end

		def show
		end

		def new
			@dorder = Dorder.new
		end

		def edit
			@dorder = Dorder.find(params[:id])
		end

		def create
			@dorder = Dorder.new(params[:dorder])
			if @dorder.save
				redirect_to admin_dorders_path,:notice => "设备预约添加成功!"
			else
				render :new
			end
		end

		def update
			@dorder = Dorder.find(params[:id])
			if @dorder.update_attributes(params[:dorder])
				redirect_to admin_dorders_path,:notice => "更新成功"
			else
				render :edit
			end
		end
		def destroy
		end
	end
end