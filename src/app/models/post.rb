class Post < ApplicationRecord
  mount_uploader :thumbnail_img, ThumbnailImgUploader
  belongs_to :user
  
  has_many :likes, dependent: :destroy

  def like_by(user)
    likes.where(likes: { user_id: user }).last
  end

  def liked_by?(user)
    like_by(user).present?
  end
end
