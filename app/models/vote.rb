class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :agency
  attr_accessible :agency_id, :user_agency_id, :user_id, :vote
end
