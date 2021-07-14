class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:user, :likes, :post_arbitrary).page(params[:page]).order(created_at: :desc).per(5)
    @posts_create_order = Post.all.includes(:liked_users, :user, :post_arbitrary).limit(3).order(created_at: :desc)
    @posts_like_order = Post.includes(:user, :post_arbitrary).joins(:likes).group('likes.post_id').limit(3).order('count(post_id) DESC')
  end
  
  def show
    @post = Post.includes(:user, :likes, :post_arbitrary, :comments).find(params[:id])
    @posts_create_order = Post.all.includes(:liked_users, :user, :post_arbitrary).limit(3).order(created_at: :desc)
    @posts_like_order = Post.includes(:user, :post_arbitrary).joins(:likes).group('likes.post_id').limit(3).order('count(post_id) DESC')
  end
  
  def search
    @posts = Post.search(params[:keyword]).page(params[:page]).per(5)
    @posts = Post.sort_category(params[:category_keyword]).page(params[:page]).per(5)
    @posts_create_order = Post.all.includes(:liked_users, :user, :post_arbitrary).limit(3).order(created_at: :desc)
    @posts_like_order = Post.includes(:user, :post_arbitrary).joins(:likes).group('likes.post_id').limit(3).order('count(post_id) DESC')
  end

  def new
    @form = PostForm.new
  end

  def create
    @form = PostForm.new(post_params)

    if @form.valid?
      @form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    load_post

    @form = PostForm.new(post: @post)
    
  end

  def update
    load_post

    @form = PostForm.new(post_params, post: @post) 
 
    if @form.valid? 
      @form.save
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to('/')
  end


  private
    def post_params
      params.require(:post).permit(
        :title,
        :category,
        :catchphrase,
        :servis_content,
        :evelopment_background,
        :site_url,
        :thumbnail_img,
        :post_id
      ).merge(user_id: current_user.id)
    end

    def load_post
      @post = current_user.posts.find(params[:id])
    end
end
