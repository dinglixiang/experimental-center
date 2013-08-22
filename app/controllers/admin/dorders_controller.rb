#encoding:utf-8

module Admin 
	class DordersController < AdminController
    before_filter :find_dorder,only: [:edit,:show,:update,:destroy,:pass,:unpass]

	def index
		@dorders = Dorder.all
	end

	def show
	end

	def new
		@dorder = Dorder.new
	end

	def edit
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
		if @dorder.update_attributes(params[:dorder])
			redirect_to admin_dorders_path,:notice => "更新成功"
		else
			render :edit
		end
	end
	def destroy
      @dorder.destroy
      redirect_to admin_dorders_path,:notice => "删除成功"
	end

    def pass
     # @dorder.device.remain -= 1
    #  @device = @dorder.device
      @dorder.state=2
      @dorder.opinion = "审核通过"
      @dorder.update_attributes(params[:dorder])
      @device = Device.find(@dorder.device_id)
      @device.remain -= 1
      @device.update_attributes(params[:device])
      redirect_to admin_dorders_path,:notice => "审核通过"
     # render json: @device
    end

    def unpass
      @dorder.state = 3
      @dorder.opinion = "审核未通过"
      @dorder.update_attributes(params[:dorder])
      redirect_to admin_dorders_path,:notice => "审核未通过"
    end

    private
    def find_dorder
		@dorder = Dorder.find(params[:id])
    end
	end
end
