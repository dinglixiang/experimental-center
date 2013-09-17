#encoding: utf-8
module Admin 
	class HomeController < AdminController

	def index
		@sorders=Sorder.all
		@dorders=Dorder.all
	end		
	end
end
