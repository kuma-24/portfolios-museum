class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:user)
  end

  def new
    @post = PostForm.new
  end

  def create
    @post = PostForm.new(post_params)
    #newメソッドで、インスタンスを生成します。

    if @post.valid?
      @post.save #インスタンスをモデルに保存します。（newメソッドとワンセット）返り値は「boolean」
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def post_params
      params.require(:post_form).permit(
        :title,
        :catchphrase,
        :servis_content,
        :evelopment_background,
        :thumbnail_img,
        :site_url,
        :github_url
      ).merge(user_id: current_user.id)
    end
end
