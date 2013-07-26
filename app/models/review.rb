class Review < ActiveRecord::Base
  attr_accessible :agency_id, :user_id, :body
  belongs_to :user
  belongs_to :agency
  validates :agency_id, :presence => true
  validates :user_id, :presence => true
  validates :body, :presence => true
  validates :user_id, :numericality => true
  validates :agency_id, :numericality => true
end