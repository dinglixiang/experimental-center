#encoding:utf-8
module Admin
	class SitesController < AdminController
    before_filter :find_site,only: [:show,:edit,:destroy,:update]

		def index
			@sites = Site.page(params[:page]).per(10)
		end
		def show
		end

		def new
			@site = Site.new
		end
		def create
			@site = Site.new(params[:site])
			if @site.save
				#render json: @site
				redirect_to admin_sites_path,:notice => "场地添加成功！"
			else
				render :new
			end
		end

		def edit
		end

		def update
			if @site.update_attributes(params[:site])
				redirect_to admin_sites_path,:notice => "更新成功！"
			else
				render :edit
			end
		end
		def destroy
			if @site.delete
				redirect_to admin_sites_path,:notice => "删除成功!"
			else
				redirect_to admin_sites_path,:notice => "删除失败!"
			end
		end

		private
		def find_site
			@site = Site.find(params[:id])
		end
	end
end
