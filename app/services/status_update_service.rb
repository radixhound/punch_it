class StatusUpdateService < BasicService

  attr_accessor :status, :user, :activity
  attr_writer :user_id

  def self.update(attributes = {})
    new(attributes).update
  end

  def initialize(attributes = {})
    super
    @user ||= User.find(user_id) 
  end

  def update
    @activity = Activity.new(is_in: is_in?, description: parsed_description)
    user.activities << activity
    self
  end  

  def user_id
    @user_id || @user.try(:id)
  end

  private

  def is_in?
    (status =~ /^OUT/).nil? 
  end

  def parsed_description
    status.sub(/^(IN|OUT)\:?/,'').strip
  end

end

