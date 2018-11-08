class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    authenticated = user.try(:authenticate, params[:password])
    return head(:forbidden) unless authenticated
    @user = user
    session[:user_id] = @user.id
    end
  end

  def destroy
    session.clear
    redirect_to controller: 'application', action: 'hello'
  end
end
