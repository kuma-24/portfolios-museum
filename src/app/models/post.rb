class Post < ApplicationRecord
  mount_uploader :thumbnail_img, ThumbnailImgUploader
  belongs_to :user
  has_one :url, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def like_by(user)
    likes.where(likes: { user_id: user }).last
  end

  def liked_by?(user)
    like_by(user).present?
  end
end
