class Site
  include Mongoid::Document

  field :name,type: String
  field :description
  field :state
  #field :logo
end
