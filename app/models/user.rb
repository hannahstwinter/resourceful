class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :name, :email, :password, :password_confirmation

  validates_presence_of :email
  validates_uniqueness_of :email

  def self.authenticate(email)
    find_by_email(email).try(:authenticate, password)
  end

end
