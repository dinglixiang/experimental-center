#encoding:utf-8

module Admin 
	class HomeController < AdminController

		def index
      @dorders = Dorder.all
      @sorders = Sorder.all
		end		
	end
end
