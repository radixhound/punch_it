class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash.now[:alert] = "Signed up"
      auto_login @user
      redirect_to user_activities_path
    else
      render :new
    end
  end
end
