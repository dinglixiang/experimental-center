#encoding:utf-8

module Admin 
	class NoticesController < AdminController
		before_filter :find_notice,only: [:show,:edit,:update,:destroy,:pass,:unpass]
    
		def index
			@notices = Notice.all
		end

		def show
		end

		def new
			@notice = Notice.new
		end

		def create
			@notice = Notice.new(params[:notice])
			if @notice.save
				redirect_to admin_notices_path,:notice => "创建成功"
			else
				render :new
			end
		end
		def edit
		end

		def update
			if @notice.update_attributes(params[:notice])
				redirect_to admin_notices_path,:notice => "更新成功!"
			else
				redirect_to admin_notices_path,:alert => "更新失败!"
			end
		end

		def destroy
			if @notice.delete
				redirect_to admin_notices_path,:notice => "删除成功!"
			else
				redirect_to admin_notices_path,:alert => "删除失败!"
			end
		end

    def pass
      @notice.state = 2
      @notice.update_attributes(params[:notice])
      redirect_to admin_notices_path
    end

    def unpass
      @notice.state = 3 
      @notice.update_attributes(params[:notice])
      redirect_to admin_notices_path
    end

    private
    def find_notice
      @notice = Notice.find(params[:id])
    end
	end
end
