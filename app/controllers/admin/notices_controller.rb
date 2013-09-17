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
		def edit
			@notice = Notice.find(params[:id])
		end

		def update
			@notice = Notice.find(params[:id])
			if @notice.update_attributes(params[:notice])
				redirect_to admin_notices_path,:notice => "更新成功!"
			else
				redirect_to admin_notices_path,:notice => "更新失败!"
			end
		end

		def destroy
			if @notice.delete
				redirect_to admin_notices_path,:notice => "删除成功!"
			else
				redirect_to admin_notices_path,:notice => "删除失败!"
			end
		end

        def pass
          @notice = Notice.find(params[:id])
          @notice.state = true
          @notice.update_attributes(params[:notice])
          redirect_to admin_notices_path
        end

        def unpass
         @notice = Notice.find(params[:id])
         @notice.state = false 
         @notice.update_attributes(params[:notice])
         redirect_to admin_notices_path
        end

       private
       def find_by_id
         @notice = Notice.find(params[:id])
       end
	end
end
