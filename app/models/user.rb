class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :agency_id, :authz
  has_secure_password
  has_many :votes
  has_many :contacts
  has_many :reviews
  belongs_to :agency
  validates_presence_of :email, :on => :create
  validates_uniqueness_of :email
  validates :name, :presence => true
  validates_presence_of :password, :on => :create
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "address is invalid" }

  def self.authenticate(email)
    find_by_email(email).try(:authenticate, password)
  end

  def self.role?(user)
    user.authz
  end

  def self.authorize(user_id, access_key)
    user = User.find(user_id)
    if access_key == ENV["NRVCS_ADMIN_KEY"]
      user.update_attribute(:authz, "admin")
    elsif access_key == ENV["NRVCS_BASIC_KEY"]
      user.update_attribute(:authz, "basic")
    end
    return user
  end

end
