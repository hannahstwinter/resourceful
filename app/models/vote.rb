class Vote < ActiveRecord::Base
  attr_accessible :agency_id, :user_agency_id, :user_id, :vote
end
