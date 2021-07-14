class PostArbitrary < ApplicationRecord
  mount_uploader :thumbnail_img, ThumbnailImgUploader
  belongs_to :post

  validates :thumbnail_img, presence: true
end
