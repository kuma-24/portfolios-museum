class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def ensure_normal_user
    email = resource&.email || params[:user][:email].downcas
    return unless email == 'guest@example.com'

    redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。'
  end

  def index; end

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
