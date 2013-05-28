class Contact < ActiveRecord::Base
  attr_accessible :agency_id, :notes, :user_id, :name, :phone
end
