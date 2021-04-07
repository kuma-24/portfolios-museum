class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def ensure_normal_user
    email = resource&.email || params[:user][:email].downcas
    return unless email == 'guest@example.com'

    redirect_to edit_user_registration_path, alert: 'ゲストユーザー様の変更・退会はできません。'
  end

  def index; end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
