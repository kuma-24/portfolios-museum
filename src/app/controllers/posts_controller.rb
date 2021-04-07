class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = PostForm.new
  end

  def create
    @post = PostForm.new(post_params)

    if @post.valid?
      @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private

    def post_params
      params.require(:post_form).permit(
        :title,
        :servis_content,
        :evelopment_background,
        :thumbnail_img,
        :site_url,
        :github_url
      ).merge(user_id: current_user.id)
    end
end
