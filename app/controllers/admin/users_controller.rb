class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  def index
    @users = User.order(:email)
  end

  def show;  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'User has been created.' }
      else
        format.html do
          flash.now[:alert] = 'User has not been create.'
          render 'new', status: :unprocessable_entity
        end
      end
    end
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: 'User has been updated' }
      else
        format.html do
          flash.now[:alert] = 'User has not been updated'
          render :edit, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end
end
