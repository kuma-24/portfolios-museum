class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def new
    @post = PostForm.new
  end

  def create
    @post = PostForm.new(post_params)

    if @post.valid?
      @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def post_params
      params.require(:post_form).permit(
        :title,
        :category,
        :catchphrase,
        :servis_content,
        :evelopment_background,
        :site_url,
        :thumbnail_img
      ).merge(user_id: current_user.id)
    end
end
