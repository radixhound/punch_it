class StatusController < ApplicationController
  def create
    StatusUpdateService.update(params[:status_update_service].merge(user: current_user))
    redirect_to user_activities_path
  end
end
