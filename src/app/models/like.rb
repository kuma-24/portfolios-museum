class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates_uniqueness_of :post_id, scope: :user_id
  
  LIKED_COLOR = "like #ff3366".freeze
  UNLIKED_COLOR = "unlike #fff".freeze
end
