class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :agency_id
  has_secure_password
  has_many :votes
  has_many :contacts
  has_many :reviews
  belongs_to :agency
  validates_presence_of :email, :on => :create
  validates_uniqueness_of :email
  validates :name, :presence => true
  validates_presence_of :password, :on => :create
  # validates :email, :format => { :with => /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/,
  #   :message => "Invalid Email" }

  def self.authenticate(email)
    find_by_email(email).try(:authenticate, password)
  end
end

 # it { should_not allow_mass_assignment_of(:password) }
