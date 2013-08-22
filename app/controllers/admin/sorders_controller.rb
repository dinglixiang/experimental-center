#encoding:utf-8
module Admin 
	class SordersController < AdminController
    before_filter :find_sorder,only: [:show,:update,:destroy,:edit,:pass,:unpass] 
		def index
			@sorders = Sorder.all
		end

		def new
		end
		def show
		end
		def create
		end

    def edit
    end

		def update
		end
		def destroy
      @sorder.destroy
      redirect_to admin_sorders_path,:notice => "删除成功"
		end

    def pass
      @sorder.state = 2
      @sorder.opinion = "审核通过"
      @sorder.update_attributes(params[:sorder])
      @site = Site.find(@sorder.site_id)
      @site.state = "忙碌"
      @site.update_attributes(params[:site])
      redirect_to admin_sorders_path,:notice => "审核通过"
    end

    def unpass
      @sorder.state = 3
      @sorder.opinion = "审核未通过"
      @sorder.update_attributes(params[:sorder])
     # @site = Site.find(@sorder.site_id)
     # @site.state = "空闲"
     # @site.update_attributes(params[:site])
      redirect_to admin_sorders_path,:notice => "审核未通过"
    end

    private
    def find_sorder
      @sorder = Sorder.find(params[:id])
    end
	end
end
