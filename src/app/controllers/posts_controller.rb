class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:user, :likes, :post_arbitrary).order(created_at: :desc)
    @posts_like_order = Post.includes(:liked_users, :user, :post_arbitrary).limit(3).sort { |a, b| b.liked_users.size <=> a.liked_users.size }
    @posts_create_order = Post.all.includes(:liked_users, :user, :post_arbitrary).limit(3).order(created_at: :desc)
  end

  def show
    @post = Post.includes(:user, :likes, :post_arbitrary, :comments).find(params[:id])
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

  def search
    @posts = Post.search(params[:keyword])
    @posts = Post.sort_category(params[:category_keyword])
    @posts_like_order = Post.includes(:liked_users, :user, :post_arbitrary).limit(3).sort { |a, b| b.liked_users.size <=> a.liked_users.size }
    @posts_create_order = Post.all.includes(:liked_users, :user, :post_arbitrary).limit(3).order(created_at: :desc)
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
