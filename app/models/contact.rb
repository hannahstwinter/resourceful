class Contact < ActiveRecord::Base
  attr_accessible :agency_id, :notes, :user_id, :first_name, :last_name, :phone, :agency_name
  belongs_to :user
  validates :agency_id, :presence => true
  validates :user_id, :presence => true
  validates :user_id, :numericality => true
  validates :agency_id, :numericality => true

  def self.search(search, user_id)
    contacts = Contact.where(user_id: user_id).where('first_name like ? OR last_name like ? OR agency_name like ? OR notes like ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%").order('last_name')
  end

  def self.display(user_id)
    contacts = Contact.where("user_id = ?", user_id).order('last_name')
  end

  def self.update_agency_id(id)
    contacts = Contact.where(:agency_id => id)
    contacts.each do |contact|
      contact.update_attribute(:agency_id, nil)
    end
  end

end
