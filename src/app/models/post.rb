class Post < ApplicationRecord
  belongs_to :user
  has_one :post_arbitrary, dependent: :destroy
  has_many :likes, dependent: :destroy

  def like_by(user)
    likes.where(likes: { user_id: user }).last
  end

  def liked_by?(user)
    like_by(user).present?
  end
end
