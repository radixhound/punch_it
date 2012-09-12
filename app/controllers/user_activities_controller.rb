class UserActivitiesController < ApplicationController
  def index
    @status_update = StatusUpdateService.new(user: current_user )
    @users = User.where("id > 0").includes(:latest_activity)
    @users = @users.order("username ASC")
  end

  def show
  end

  def create
  end

end

