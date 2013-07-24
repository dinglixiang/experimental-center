class Device
  include Mongoid::Document

  field :name, type: String
  field :type, type: String
  field :remain, type: String
  field :image, type: String

  mount_uploader :image, ImageUploader
end
