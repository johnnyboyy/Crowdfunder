class Pledge < ActiveRecord::Base
  attr_accessible :amount, :project, :user_id

  belongs_to :user
  belongs_to :project
end
