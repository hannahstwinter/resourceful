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
  before_create { generate_token(:auth_token) }

  def self.authenticate(email)
    find_by_email(email).try(:authenticate, password)
  end

  def self.role?(user)
    user.authz
  end

  def self.authorize(user_id, access_key)
    user = User.find(user_id)
    if access_key == ENV["NRVCS_ADMIN_KEY"]
      user.update_column(:authz, "admin")
    elsif access_key == ENV["NRVCS_BASIC_KEY"]
      user.update_column(:authz, "basic")
    end
    return user
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    Mailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
