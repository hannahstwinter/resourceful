class Contact < ActiveRecord::Base
  attr_accessible :agency_id, :notes, :user_id, :first_name, :last_name, :phone
  belongs_to :user
  validates :agency_id, :presence => true
  validates :user_id, :presence => true
  validates :user_id, :numericality => true
  validates :agency_id, :numericality => true

  def self.search(search, search_by, user_id)
    if search_by == 'agency'
      agencies = Agency.where('tag like ? OR name like ?', "%#{search}%", "%#{search}%")
      return Contact.compile_list(agencies, nil, user_id)
    elsif search_by == 'contact'
      contacts = Contact.where(user_id: search).where('first_name like ? OR last_name like ?', "%#{search}%", "%#{search}%").order('last_name')
      return Contact.compile_list(nil, contacts, user_id)
    # else
    #   return Contact.display(user_id)
    end
  end

  def self.compile_list(agencies, contacts, user_id)
    if agencies == nil
      agencies = []
      contacts.each do |contact|
        agencies << Agency.find(contact.agency_id)
      end
    else #if contacts == nil
      contacts = []
      agencies.each do |agency|
        contacts << Contact.where(user_id: user_id, agency_id: agency.id).order('last_name')
      end
      contacts.flatten!
    end
    return contacts.zip(agencies)
  end

  def self.display(user_id)
    contacts = Contact.where("user_id = ?", user_id).order('last_name')
    agencies = []
    contacts.each do |contact|
      agencies << Agency.find(contact.agency_id)
    end
    return Contact.compile_list(agencies, contacts, user_id)
  end

end

# @contacts = Contact.search(params[:search])
# @agencies = []
# @contacts.each do |contact|
#   @agencies << Agency.find(contact.agency_id)
# end
# @contact_list = @contacts.zip(@agencies)

 # it { should_not allow_mass_assignment_of(:password) }