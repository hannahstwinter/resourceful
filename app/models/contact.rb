class Contact < ActiveRecord::Base
  attr_accessible :agency_id, :notes, :user_id, :name, :phone
  belongs_to :user
  validates :agency_id, :presence => true
  validates :user_id, :presence => true
  validates :user_id, :numericality => true
  validates :agency_id, :numericality => true
end

 # it { should_not allow_mass_assignment_of(:password) }