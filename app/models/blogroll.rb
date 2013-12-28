#encoding: utf-8
class Blogroll
  include Mongoid::Document

  field :name,type: String
  field :link_str,type: String
end
