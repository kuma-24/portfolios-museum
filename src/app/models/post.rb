class Post < ApplicationRecord
  mount_uploader :thumbnail_img, ThumbnailImgUploader
  belongs_to :user
  has_one :url
end
