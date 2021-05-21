class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  LIKED_COLOR = 'like #ff3366'.freeze
  UNLIKED_COLOR = 'unlike #fff'.freeze
end
