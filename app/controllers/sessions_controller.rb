class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = login(params[:username], params[:password])
    if user
      redirect_back_or_to user_activities_path notice: "Welcome #{user.username}!"
    else
      flash.now.alert = "Username or password was invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url  notice: "Logged out!"
  end
end
