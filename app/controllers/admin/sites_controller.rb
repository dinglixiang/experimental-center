#encoding:utf-8
module Admin
	class SitesController < AdminController

		def index
			@sites = Site.all
		end
		def show
			@site = Site.find(params[:id])
		end
		def new
			@site = Site.new
		end
		def create
			@site = Site.new(params[:site])
			if @site.save
				redirect_to admin_sites_path,:notice => "场地添加成功！"
			else
				render :new
			end
		end
		def edit
			#@site = Site.find(params[:id])
		end
		def update
			@site = Site.find(params[:id])
			if @site.update_attributes(params[:site])
				redirect_to admin_sites_path,:notice => "更新成功！"
			else
				render :edit
			end
		end
		def destroy
			@site = Site.find(params[:id])
			if @site.delete
				redirect_to admin_sites_path,:notice => "删除成功!"
			else
				redirect_to admin_sites_path,:notice => "删除失败!"
			end
		end
	end
end
