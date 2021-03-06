class Contact < ActiveRecord::Base
  attr_accessible :agency_id, :notes, :user_id, :first_name, :last_name, :phone, :agency_name, :email
  belongs_to :user
  validates :agency_id, :presence => true
  validates :user_id, :presence => true
  validates :user_id, :numericality => true
  validates :agency_id, :numericality => true

  def self.update_agency_id(id)
    contacts = Contact.where(:agency_id => id)
    contacts.each do |contact|
      contact.update_attribute(:agency_id, nil)
    end
  end

  def self.display(user_id, search)
    if search
      Contact.where(user_id: user_id).where('first_name like ? OR last_name like ? OR agency_name like ? OR notes like ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%").order('last_name')
    else
      Contact.where("user_id = ?", user_id).order('last_name')
    end
  end

  def self.authz_and_destroy(current_user, contact)
    if current_user.id == contact.user_id
      Contact.destroy(contact.id)
      return true
    else
      return false
    end
  end

end
