#encoding: utf-8
module Admin 
  class HomeController < AdminController

	def index
      
      @sorders = Sorder.where(state: 1)
      # annual_statement
      @chart = Dorder.basic_line_chart
      device = Device.last
      @dorders = device.dorders
        # dorders = Array.new
      # @dorders.first.group_by("created_at", "month")
      
     # render json: @dorders.where(:usereason => "df").count
      

	end	

  def annual_statement
    @dorders = Dorder.published
      @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "设备借用统计表[2012-2013年度统计数据]")
        f.xAxis(:categories => ["United States", "Japan", "China", "Germany", "France"])
        @dorders.each do |order|
        f.series(:name => order.device_name, :yAxis => 0, :data => [14119, 5068, 4985, 3339, 2656,3000])
        # f.series(:name => "数码照相机", :yAxis => 1, :data => [310, 127, 1340, 81, 65])
        end
        f.yAxis [
          {:title => {:text => "借用次数 (/次)", :margin => 50} },
          {:title => {:text => "借用次数 (/次)"}, :opposite => true},
        ]
        f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
        
        f.chart({:defaultSeriesType=>"column"})
      end
  end

  def group_by_month(month)

    @orders = Dorder.where(updated_at: month).count
  end

  def same_month?(t)
    self.updated_at.month
  end
  end
end
