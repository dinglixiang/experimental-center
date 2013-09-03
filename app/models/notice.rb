class Notice
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Document::Taggable
  
  field :title, type: String
  field :content, type: String
  field :author, type: String
  field :state, type: Integer,:default => 1

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

  def self.selecttag
     ["学院新闻","通知公告"]
  end
end
