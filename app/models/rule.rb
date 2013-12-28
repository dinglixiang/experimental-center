#encoding: utf-8
class Rule
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :content
end
