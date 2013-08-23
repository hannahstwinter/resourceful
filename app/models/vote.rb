class Vote < ActiveRecord::Base
  attr_accessible :agency_id, :user_agency_id, :user_id, :vote
  belongs_to :user
  belongs_to :agency
  validates :agency_id, :presence => true
  validates :user_agency_id, :presence => true
  validates :vote, :presence => true
  validates :user_id, :presence => true
  validates :user_id, :uniqueness => { :scope => :agency_id }
  validates :user_id, :numericality => true
  validates :agency_id, :numericality => true
  validates :user_agency_id, :numericality => true
  validates :vote, :numericality => true
end
