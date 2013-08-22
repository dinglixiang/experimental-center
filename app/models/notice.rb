class Notice
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, type: String
  field :content, type: String
  field :author, type: String
  field :state, type: Boolean,:default => false

  def pass_state
     (state == true)? "已审核" : "未审核"
  end
end
