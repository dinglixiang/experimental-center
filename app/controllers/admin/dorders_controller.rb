#encoding:utf-8
module Admin 
	class DordersController < AdminController
  before_filter :find_dorder,only: [:edit,:show,:update,:destroy,:pass,:unpass,:revert,:return]
  # before_filter :sms_use,only: [:pass,:unpass]

	def index	
		@dorders = Dorder.unauthed.page(params[:page])		
	end

  def published_list
    @dorders = Dorder.published.page(params[:page])
  end

  def banned_list
    @dorders = Dorder.banned.page(params[:page])
  end

  def returned_list
    @dorders = Dorder.return.page(params[:page])
  end
  
  def history
    @dorders = Dorder.all.page(params[:page])
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
			redirect_to admin_dorders_path,:notice => "更新失败"
		end
	end
	def destroy
      @dorder.destroy
      redirect_to admin_dorders_path,:notice => "删除成功"
	end

    def pass
      @dorder.state = 2
      @dorder.opinion = "审核通过"    
      #render json: @dorder.device.remain-1
      @device = Device.find(@dorder.device_id)
      @device.remain -= 1
      if @dorder.update_attributes(params[:dorder]) && @device.update_attributes(params[:device])
        #ChinaSMS.to "#{@dorder.tel}", "Center：#{@dorder.applicant}您好，您预约的#{@dorder.device_name}已通过审核，请规范使用并及时归还。[实验中心]"
      	#sms_send(@dorder.tel,@dorder.applicant,@dorder.device_name)
        redirect_to admin_dorders_path,:notice => "审核通过"
      else
      	redirect_to admin_dorders_path,:notice => "操作失败"
      end
     # render json: @device
    end

    def unpass
      @dorder.state = 3
      @dorder.opinion = "审核未通过"
      @dorder.update_attributes(params[:dorder])
      redirect_to admin_dorders_path,:alert => "审核未通过"
    end

    def revert
    end

    def return
    	@dorder.state,@dorder.opinion = 4,"已归还"
    	@device = Device.find(@dorder.device_id)
    	@device.remain += 1  
    	if @dorder.update_attributes(params[:dorder]) && @device.update_attributes(params[:device])
    		
				redirect_to admin_dorders_path,:notice => "归还成功"
			else
				redirect_to admin_dorders_path,:notice => "归还失败"
			end
    end

    private
    def find_dorder
		@dorder = Dorder.find(params[:id])
    end

    def sms_use
    	ChinaSMS.use :tui3, username: 'dinglixiang', password: 'd9cf4edec1321adb738371e712d1b07c'
    end
    #发送短信
    def sms_send(phone,name,content)
			ChinaSMS.to "#{phone}", "Center：#{name}您好，您预约的#{content}已通过审核，请规范使用并及时归还。[实验中心]"
    end
	end
end
