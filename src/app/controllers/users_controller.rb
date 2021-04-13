class UsersController < ApplicationController
  before_action :authenticate_user! only: [:edit, :update]

  def index
    @users = User.all.includes(:profile)
  end

  def show
  end

  def edit
  end

  def update
  end

end
