class Project < ActiveRecord::Base
  attr_accessible :description, :goal, :teaser, :title, :user_id
  belongs_to :user
  has_many :pledges
  has_many :users, through: :pledges
  has_many :images, dependent: :destroy

  
  paginates_per 8

  validates :title, presence: true, length: {maximum: 100}
  validates :teaser, presence: true, length: {maximum: 255}
  validates :description, presence: true
  validates :goal, presence: true, numericality: {greater_than: 0, allow_blank: true}


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

  def supporters
    self.pledges.map(&:user).map(&:name)
  end

end
