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
    update_others(with_clause)
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
    @parsed_description ||= status.sub(/^(IN|OUT)\:?/,'').strip
  end


  def with_clause
    status =~ /with:\s?(.*)$/i ? $1 : false
  end

  def update_others(userlist)
    if userlist
      usernames = userlist.split(',').map{|i| i.strip}
      other_users = User.where(username: usernames)
      other_users.each do |other_user|
        other_user.activities << Activity.new(is_in: is_in?, 
          description: parsed_description.sub(other_user.username, @user.username))
      end
    end
  end

end

