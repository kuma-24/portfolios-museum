class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: %i[update destroy]

  def ensure_normal_user
    return unless resource.email == 'guest@example.com'

    redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません。'
  end

  def new
    @user = User.new
    @profile = @user.build_profile
  end

  def update; end

  def destroy; end
end
