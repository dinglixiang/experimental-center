#encoding: utf-8
class Sorder
  include Mongoid::Document
  include Mongoid::Timestamps

  field :applicant
  field :tel
  field :usetime
  field :usereason
  field :teacher
  field :site_name
  field :opinion 
  field :returntime
  field :situation
  field :keeper 
  field :state,type: Integer,default: 1

  belongs_to :site

  validates_presence_of :applicant,:tel,:usetime,:usereason
  validates_format_of :tel, :with =>  /^1[3|4|5|8]\d{9}$/, message: "联系方式格式不正确" 


  scope :unauthed, where(state: 1)
  scope :published, where(state: 2)
  scope :banned, where(state: 3)
  scope :return, where(state: 4)

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
