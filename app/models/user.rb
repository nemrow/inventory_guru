class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :password, :email
  has_many :companies, :through => :user_companies
  has_many :user_companies

  has_secure_password
end
