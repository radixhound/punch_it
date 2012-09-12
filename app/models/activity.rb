class Activity < ActiveRecord::Base
  belongs_to :user

  attr_accessible :description, :is_in

  def checked_in?
    self.is_in ? true : false
  end
end
