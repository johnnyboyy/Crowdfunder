class Pledge < ActiveRecord::Base
  attr_accessible :amount, :user_id, :project_id

  belongs_to :user
  belongs_to :project

  validates  :user, :project_id, :user_id, presence: true
  validates_numericality_of :amount, greater_than: 0


  def raised
    self.pledges.sum(:amount)
  end

  def percent_raised
    ((raised.to_f / goal) * 100).to_i
  end

  def succeeded?
    percent_raised >= 100
  end

  def surpassed_goal?
    percent_raised > 100
  end

  def number_of_supporters
    self.supporters.uniq.count # if you make two pledges, you are still one supporter
  end
end
