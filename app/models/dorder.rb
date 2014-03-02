#encoding:utf-8
class Dorder
  include Mongoid::Document
  include Mongoid::Timestamps

  
  field :applicant
  field :tel
  field :usetime,type: String
  field :usereason
  field :teacher
  field :device_name
  field :device_num
  field :opinion 
  field :returntime
  field :situation
  field :keeper 
  field :device_id
  field :state,type: Integer,default: 1

  validates_presence_of :applicant,:tel,:usetime,:usereason
  validates_format_of :tel, :with =>  /^1[3|4|5|8]\d{9}$/, message: "联系方式格式不正确" 

  belongs_to :device

  scope :unauthed, where(state: 1)
  scope :published, where(state: 2)
  scope :banned, where(state: 3)
  scope :return, where(state: 4)
 # scope :home_show,where(state: [2..3])


  def group_by(field, format = 'day')
    key_op = [['year', '$year'], ['month', '$month'], ['day', '$dayOfMonth']]
    key_op = key_op.take(1 + key_op.find_index { |key, op| format == key })
    project_date_fields = Hash[*key_op.collect { |key, op| [key, {op => "$#{field}"}] }.flatten]
    group_id_fields = Hash[*key_op.collect { |key, op| [key, "$#{key}"] }.flatten]
    pipeline = [
        {"$project" => {"name" => 1, field => 1}.merge(project_date_fields)},
        {"$group" => {"_id" => group_id_fields, "count" => {"$sum" => 1}}},
        {"$sort" => {"count" => -1}}
    ]
    collection.aggregate(pipeline)
  end

  def self.basic_line_chart
    @dorders = Dorder.published
      @chart = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "设备借用统计表年度统计数据]")
        f.xAxis(:categories => ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"])

        @dorders.each do |order|
        f.series(:name => order.device_name, :yAxis => 0, :data => [14119, 5068, 4985, 3339, 2656,3000])
        # f.series(:name => "数码照相机", :yAxis => 1, :data => [310, 127, 1340, 81, 65])
        end
        f.yAxis [
          {:title => {:text => "借用次数 (/次)", :margin => 50} },
          {:title => {:text => "借用次数 (/次)"}, :opposite => true},
        ]
      f.exporting(:enabled=>true,:enableImages=> true,:filename=>"#{DateTime.now}-intfocus")
        f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
        f.chart({:defaultSeriesType=>"column"})
      end
      return @chart
  end


  STATUS =["未审核","审核通过","未通过","已归还"]

  def pass_state
    if state == 1
     "<span class='label label-warning'> #{STATUS[0]}</span>" 
    elsif state == 2
      "<span class='label label-success'>#{STATUS[1]}</span>" 
    elsif state == 3 
      "<span class='label label-info'>#{STATUS[2]}</span>" 
    else
      "<span class='label'>#{STATUS[3]}</span>" 
    end
  end

  def authed?
    state == 1
  end
  
  def passed?
    state == 2
  end

  def banned?
    state == 3
  end

  def returned?
    state == 4
  end
end
