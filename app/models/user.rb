class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name,
  					 :username, :email, :password,
  					 :password_confirmation



  has_many :projects
  has_many :pledges

  authenticates_with_sorcery!

  validates :first_name, :last_name, presence: true

  def name
  	return "#{self.first_name} #{self.last_name}"
  end

end
