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
end
