class UsersController < ApplicationController
  def index
    @users = User.all.includes(:profile)
  end

  def show; end

  def edit; end

  def update; end
end
