class Video
  include Mongoid::Document

  field :name, type: String
  field :vimage, type: String
  field :video, type: String

  mount_uploader :vimage, ImageUploader
  mount_uploader :video, AvatarUploader
end
