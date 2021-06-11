class Post < ApplicationRecord
  include PostSearch

  belongs_to :user
  has_one :post_arbitrary, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def like_by(user)
    likes.where(likes: { user_id: user }).last
  end

  def liked_by?(user)
    like_by(user).present?
  end
end
