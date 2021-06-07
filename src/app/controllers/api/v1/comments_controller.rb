module Api
  module V1
    class CommentsController < ApplicationController
      def create
        comment = Comment.create!(comment_params)
        comment_time = comment.day_time
        user = User.where(id: current_user).pluck(:name)
        profile = Profile.where(id: current_user).pluck(:avatar_img)

        render json: {
          comments: comment,
          commentTime: comment_time,
          users: user,
          profiles: profile
        }
      end

      def destroy
        Comment.find(params[:id]).destroy!
        render json: {}
      end

      private

        def comment_params
          params.require(:comment).permit(
            :comment_content,
            :post_id
          ).merge(user_id: current_user.id)
        end
    end
  end
end
