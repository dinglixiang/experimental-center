#encoding: utf-8
class Site
  include Mongoid::Document

  field :name,type: String
  field :description
  field :state,default: "空闲"
  #field :logo
  field :image, type: String

  mount_uploader :image, ImageUploader
  
  has_many :sorders

  validates_presence_of :name,:description,:state,:image

  def self.selectstate
     ["忙碌","空闲"]
  end
end
