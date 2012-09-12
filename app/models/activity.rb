class Activity < ActiveRecord::Base
  belongs_to :user

  attr_accessible :description, :in
end
