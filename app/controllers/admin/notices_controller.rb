#encoding:utf-8
module Admin 
	class NoticesController < AdminController
		before_filter :find_notice,only: [:show,:edit,:update,:destroy,:pass,:unpass], :except => [:search]
    
		def index		
			@notices = Notice.unauthed.page(params[:page])
		end

		def published_list
			@notices = Notice.published.page(params[:page])
		end

		def banned_list
			@notices = Notice.banned.page(params[:page])
		end

		def all
			@notices = Notice.all.page(params[:page])
		end

		def search
			return @notices = Notice.all.page(params[:page]).per(10) if params[:state].blank?
			@notices = Notice.where(state: params[:state]).page(params[:page]).per(10)
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
      @notice.state,@notice.tag_list = 2,"审核通过"
      @notice.update_attributes(params[:notice])
      redirect_to admin_notices_path
    end

    def unpass
      @notice.state,@notice.tag_list = 3,"未通过" 
      @notice.update_attributes(params[:notice])
      redirect_to admin_notices_path
    end

    private
    def find_notice
      @notice = Notice.where(id: params[:id]).first
    end
	end
end
