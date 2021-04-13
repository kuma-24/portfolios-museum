class Users::SessionsController < Devise::SessionsController
  
  def guest_sign_in
    user = User.guest
    profile = Profile.guest_profile
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end 
