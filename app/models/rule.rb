class Rule
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :content
end
