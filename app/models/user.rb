class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :activities
  has_one :latest_activity,
   class_name: "Activity",
   order: "created_at DESC", 
   conditions: ["created_at >= ?", Time.now.beginning_of_day]

  attr_accessible :username, :email, :password, :password_confirmation

end
