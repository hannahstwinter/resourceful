class Contact < ActiveRecord::Base
  attr_accessible :agency_id, :notes, :user_id, :name, :phone
  belongs_to :user
  validates :agency_id, :presence => true
  validates :user_id, :presence => true
  validates :user_id, :numericality => true
  validates :agency_id, :numericality => true

  def self.search(search, search_by, user_id)
    if search
      if search_by == 'agency'
        user_contacts = Contact.where('user_id = ?', user_id)
        @agencies = Agency.where('tag = ? OR name = ?', search, search)
        return @agencies
      else
        @contacts = Contact.where('user_id = ? AND name = ?', user_id, search)
        return @contacts
      end
    else
      @contacts = Contact.where('user_id = ?', user_id)
      return @contacts
    end
  end

end

# @contacts = Contact.search(params[:search])
# @agencies = []
# @contacts.each do |contact|
#   @agencies << Agency.find(contact.agency_id)
# end
# @contact_list = @contacts.zip(@agencies)

 # it { should_not allow_mass_assignment_of(:password) }