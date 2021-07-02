class UsersController < ApplicationController
  def show
    @user = User.includes(:profile).find(params[:id])
    @posts = @user.posts.includes(:user, :likes, :post_arbitrary).order(created_at: :desc)
  end

  def edit
    @user = User.includes(:profile).find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      sign_in(@user, bypass: true)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :root
  end

  private

    def user_params
      params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        profile_attributes: %i[id self_introduction avatar_img industry]
      )
    end
end
