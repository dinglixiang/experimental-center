#encoding:utf-8

module Admin 
	class VideosController < AdminController
		before_filter :find_device, only: [:show,:edit,:update,:delete]
		def index
			@videos=Video.all
		end
		def new
			@video = Video.new
		end
		def create
			@video = Video.new(params[:video])
			if @video.save
				redirect_to admin_videos_path,:notice => "视频添加成功!"
			else
				render :new
			end
		end	
		def update
			if @video.update_attributes(params[:video])
				redirect_to admin_videos_path,:notice => "更新成功!"
			else
				render :edit
			end
		end

		def destroy
			if @video.delete
				redirect_to admin_videos_path,:notice => "删除成功!"
			else
				redirect_to admin_videos_path,:notice => "删除失败!"
			end
		end

		private
		def find_device
			@video = Video.find(params[:id])
		end

	end
end