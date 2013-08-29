class Sorder
  include Mongoid::Document
  include Mongoid::Timestamps

  field :applicant
  field :tel
  field :usetime
  field :usereason
  field :site_name
  field :opinion 
  field :returntime
  field :situation
  field :keeper 
  field :site_id
  field :state,type: Integer,default: 1

  belongs_to :site

  validates_presence_of :applicant,:tel,:usetime,:usereason
  validates_format_of :tel, :with =>  /^1[3|4|5|8]\d{9}$/, message: "联系方式格式不正确" 

  STATUS =["未审核","审核通过","未通过","已审核"]

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
end
