class UserPresenter
  include ActionView::Helpers::DateHelper
  delegate :username, to: :user
  attr_reader :user 

  def self.present_each(users, current_user)
    yield new(current_user)
    users.each do |user|
      yield new(user) unless user.id == current_user.id
    end
  end

  def initialize(user)
    @user = user
  end

  def current_status
    return "--" unless @user.latest_activity
    @user.latest_activity.is_in ? "IN" : "OUT"
  end

  def status_description
    return "has not yet arrived" unless @user.latest_activity
    @user.latest_activity.description
  end

  def time_ago
    return "never" unless @user.latest_activity
    time_ago_in_words(@user.latest_activity.created_at) + " ago"
  end
end