class Post < ApplicationRecord
  belongs_to :user
  has_one :post_arbitrary, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def like_by(user)
    likes.where(likes: { user_id: user }).last
  end

  def liked_by?(user)
    like_by(user).present?
  end

  def comment_by(user)
    comments.where(comments: { user_id: user }).last
  end

  def comment_by?(user)
    comment_by(user).present?
  end
end
