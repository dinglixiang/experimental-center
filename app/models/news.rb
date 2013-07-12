class News
  include Mongoid::Document
  field :title, type: String
  field :context, type: String
  field :author, type: String
end
