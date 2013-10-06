#encoding:utf-8
module Admin 
  #友情链接
  class BlogrollsController < AdminController
  	before_filter :find_blogroll,only: [:edit,:update,:destroy]

  	def index
  		@blogrolls = Blogroll.all
  	end

  	def new
  		@blogroll = Blogroll.new
  	end

  	def create
  		@blogroll = Blogroll.new(params[:blogroll])
  		if @blogroll.save
  			redirect_to admin_blogrolls_path,notice: "添加成功."
  		else
  			render :new
  		end
  	end

  	def edit
  	end

  	def update
  		if @blogroll.update_attributes(params[:blogroll])
  			redirect_to admin_blogrolls_path,notice: "更新成功."
  		else
  			render :edit
  		end
  	end

  	def destroy
  		if @blogroll.delete
  			redirect_to admin_blogrolls_path,notice: "删除成功."
  		else
  			redirect_to admin_blogrolls_path,notice: "删除失败."
  		end
  	end

  	private
  	def find_blogroll
  		@blogroll = Blogroll.find(params[:id])
  	end

  end
 end