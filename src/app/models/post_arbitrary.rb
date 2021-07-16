class PostArbitrary < ApplicationRecord
  mount_uploader :thumbnail_img, ThumbnailImgUploader
  belongs_to :post

  validates :thumbnail_img, presence: true, on: :update
  validates :site_url, presence: true, on: :update
end
