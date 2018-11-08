class UsersController < ApplicationController
  def new
  end

  def home
  end

  def create
    @user = User.create(user_params)
    if !@user
      redirect_to controller: 'users', action: 'new'
    else
      @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'users', action: 'create'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :user_id)
  end
end
