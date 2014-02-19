#encoding: utf-8
module Admin 
  class HomeController < AdminController

	def index
      @dorders = Dorder.where(state: 1)
      @sorders = Sorder.where(state: 1)
      annual_statement

	end	

  def annual_statement
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart({
         type: 'line'
      })
      f.title({
        text: '设备借用统计表'
      })
      f.subtitle({
          text: '2012-2013年度统计数据'
      })
      f.xAxis({
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
      })
      f.yAxis({
        labels: {
                  
                    style: {
                        color: '#89A54E'
                    }
                },
         title: {
            text: '借用次数 (/次)'
        }
      })
      f.tooltip({
        enabled: false,
        formatter: %|function() {
                             return '<b>'+ this.series.name +'</b><br/>'+
                                 this.x +': '+ this.y +'°C';
                         }|.js_code

      })
      f.plotOptions({
         line: {
               dataLabels: {
                  enabled: true,
                  enableMouseTracking: false
               }
          }
      })

      f.series({
         name: '摄录一体机',
         type: 'column',
         data: [7, 6, 9, 14, 18, 21, 25, 26, 23, 18, 13, 9]
      })
      f.series({
          name: '数码照相机',
          data: [3, 4, 5, 8, 11, 15, 17, 16, 14, 10, 6, 4]
      
      })

      f.exporting(:enabled=>true,:enableImages=> true,:filename=>"#{DateTime.now}-intfocus")

    end
  end
  end

end
