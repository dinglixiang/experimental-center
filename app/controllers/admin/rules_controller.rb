#encoding:utf-8

module Admin 
	class RulesController < AdminController
		def index
			@rule = Rule.first
		end
		def new
			@rule = Rule.new
		end
		def create
			@rule = Rule.new(params[:rule])
			if @rule.save
				redirect_to admin_root_path,:notice => "规章制度添加成功！"
			else
				render :new
			end
		end
		def edit
			@rule = Rule.first
		end
		def update
			@rule = Rule.first
			if @rule.update_attributes(params[:rule])
				redirect_to admin_root_path,:notice => "规章制度更新成功！"
			else
				render :edit
			end
		end
	end
end