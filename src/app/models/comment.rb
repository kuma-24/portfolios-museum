class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :comment_content, presence: true, length: { maximum: 150 }

  def day_time
    created_at.strftime('%Y-%m-%d %H:%M ')
  end
end
