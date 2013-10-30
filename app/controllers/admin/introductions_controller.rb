#encoding:utf-8
module Admin 
  #友情链接
  class IntroductionsController < AdminController
  	before_filter :find_introduction,only: [:edit,:update,:destroy,:show]

  	def index
  		@introductions = Introduction.all
  	end

  	def show
  	end

  	def new
  		@introduction = Introduction.new
  	end

  	def create
  		@introduction = Introduction.new(params[:introduction])
  		if @introduction.save
  			redirect_to admin_introductions_path,notice: "添加成功."
  		else
  			render :new
  		end
  	end

  	def edit
  	end

  	def update
  		if @introduction.update_attributes(params[:introduction])
  			redirect_to admin_introductions_path,notice: "更新成功."
  		else
  			render :edit
  		end
  	end

  	def destroy
  		if @introduction.delete
  			redirect_to admin_introductions_path,notice: "删除成功."
  		else
  			redirect_to admin_introductions_path,notice: "删除失败."
  		end
  	end

  	private
  	def find_introduction
  		@introduction = Introduction.find(params[:id])
  	end

  end
 end