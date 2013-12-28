#encoding: utf-8
class Device
  include Mongoid::Document

  field :name, type: String
  field :type, type: String
  field :remain, type: Integer
  field :number 
  field :specification_id
  field :image, type: String

  mount_uploader :image, ImageUploader

  has_many :dorders

  validates_presence_of :name,:type,:remain,:image
end
