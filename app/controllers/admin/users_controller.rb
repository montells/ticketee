class Admin::UsersController < ApplicationController
  def index
    @users = User.order(:email)
  end

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

  private

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end
end
