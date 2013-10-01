class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name,
  					 :username, :email, :password,
  					 :password_confirmation

  authenticates_with_sorcery!

  validates :first_name, :last_name, presence: true

  has_many :projects
end
