class Notice
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Document::Taggable
  
  field :title, type: String
  field :content, type: String
  field :author, type: String
  field :state, type: Boolean,:default => false
  #field :tag_list, type: String

  def pass_state
     (state == true)? "已审核" : "未审核"
  end

  def self.selecttag
     ["学院新闻","通知公告"]
  end
end
