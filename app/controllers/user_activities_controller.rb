class UserActivitiesController < ApplicationController
  def index
    @users = User.where("id > 0").includes(:latest_activity)
    @users = @users.order("username ASC")
  end

  def show
  end

  def create
  end

end

