class UsersController < ApplicationController
  def index
    @users = User.order(:id).page(params[:page]).per(1)
  end

  def show
    @users = User.find(params[:id])
  end
end
