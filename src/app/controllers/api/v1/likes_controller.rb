module Api
  module V1
    class LikesController < ApplicationController
      def create
        like = current_user.likes.create!(user_id: current_user, post_id: params[:post_id])
        post_count = Like.where(post_id: params[:post_id]).count
        render json: {
          like_id: like.id,
          post_id: post_count
        }
      end

      def destroy
        Like.find(params[:id]).destroy!
        post_count = Like.where(post_id: params[:post_id]).count
        render json: { post_id: post_count }
      end
    end
  end
end
