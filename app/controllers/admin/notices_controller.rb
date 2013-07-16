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
				redirect_to notices_path,:notice => "success"
			else
				redirect_to new_notice_path,:notice => "faliure"
			end
		end
	end
end