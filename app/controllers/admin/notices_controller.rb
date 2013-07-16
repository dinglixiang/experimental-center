#encoding:utf-8

module Admin 
	class NoticesController < AdminController

		def index
			@notices = Notice.all
		end
		def new
			@notice = Notice.new
		end

		def create
			@notice = Notice.new(params[:notice])
			if @notice.save
				redirect_to admin_notices_path,:notice => "success"
			else
				render :new
			end
		end

		def update
			@notice = Notice.find(params[:id])
			if @notice.update_attributes(params[:notice])
				redirect_to admin_notices_path,:notice => "更新成功!"
			else
				render :edit
			end
		end

		def destroy
			@notice = Notice.find(params[:id])
			if @notice.delete
				redirect_to admin_notices_path,:notice => "删除成功!"
			else
				redirect_to admin_notices_path,:notice => "删除失败!"
			end
		end
	end
end