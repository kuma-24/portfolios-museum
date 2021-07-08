class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :comment_content, 
    presence: { message: '※コメントを入力してください' },
    length: { maximum: 200, message: '※150文字以下で入力してください' }

  def day_time
    created_at.strftime('%Y-%m-%d %H:%M ')
  end
end
