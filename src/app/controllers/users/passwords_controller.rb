class Users::PasswordsController < Devise::PasswordsController
  before_action :ensure_normal_user, only: :create
end
