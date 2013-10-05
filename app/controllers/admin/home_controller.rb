#encoding:utf-8

module Admin 
  class HomeController < AdminController

	def index
      @dorders = Dorder.where(state: 1)
      @sorders = Sorder.where(state: 1)
	end		
  end
end
