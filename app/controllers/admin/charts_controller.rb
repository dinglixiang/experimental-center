#encoding:utf-8
module Admin 
  #图表
  class ChartsController < AdminController

  	def basic_line
  		@chart = Dorder.basic_line_chart
  	end

  end
end