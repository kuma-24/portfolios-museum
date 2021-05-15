class UsersController < ApplicationController
  def index
    @users = User.all.includes(:profile)
  end

  def show
    @user = User.includes(:profile).find(params[:id])
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
    @user = User.find(params[:id]) #特定のidを持つ情報を取得
    @user.destroy
    redirect_to :root #削除に成功すればrootページに戻る
  end

  private

    def user_params
      params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        profile_attributes: %i[id self_introduction avatar_img]
      )
    end
end
