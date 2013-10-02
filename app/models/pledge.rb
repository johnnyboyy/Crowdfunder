class Pledge < ActiveRecord::Base
  attr_accessible :amount, :user_id, :project_id

  belongs_to :user
  belongs_to :project

  validates  :user, :project_id, :user_id, presence: true
  validates_numericality_of :amount, greater_than: 0



end
