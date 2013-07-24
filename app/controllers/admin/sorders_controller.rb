#encoding:utf-8

module Admin 
	class SordersController < AdminController

		def index
			@sorders = Sorder.all
		end

		def new
		end
		def show
		end
		def create
		end

		def update
		end
		def destroy
		end
	end
end