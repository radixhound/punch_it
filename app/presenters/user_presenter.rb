class UserPresenter
  delegate :username, to: :user
  attr_reader :user 

  def self.present_each(users)
    users.each do |user|
      yield new(user)
    end
  end

  def initialize(user)
    @user = user
  end

  def current_status
    return "NA" unless @user.latest_activity
    @user.latest_activity.is_in ? "IN" : "OUT"
  end

  def status_description
    return "has not yet arrived" unless @user.latest_activity
    @user.latest_activity.description
  end
end