class PostArbitrary < ApplicationRecord
  mount_uploader :thumbnail_img, ThumbnailImgUploader
  belongs_to :post
end
