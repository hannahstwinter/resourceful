class Agency < ActiveRecord::Base
  attr_accessible :city, :in_house_rating, :long_description, :name, :overall_rating, :client_rating, :phone, :short_description, :state, :street, :tag, :url
  has_many :votes
  has_many :users
  has_many :reviews
  validates :name, :presence => true
  validates :street, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :short_description, :presence => true
  validates :long_description, :presence => true
  validates :tag, :presence => true
  validates :phone, :presence => true
  validates :name, :uniqueness => true
  validates :phone, :format => { :with => /^.?\d{3}.?\d{3}.?\d{4}/,
  :message => "Invalid phone number format" }

  def self.search(search, current_user, contact_agency_ids)
    if search && current_user
      agencies = Agency.where('tag like ? OR name like ?', "%#{search}%", "%#{search}%")
      agencies.each do |agency|
        if contact_agency_ids.has_value?(agency.id)
          agencies.unshift(agency)
        end
        agencies.uniq!
      end
    elsif search
      agencies = Agency.where('tag like ? OR name like ?', "%#{search}%", "%#{search}%")
    else
      agencies = Agency.order("created_at DESC").limit(5)
    end
  end

  def self.find_similar(name)
    Agency.where('name LIKE ?', name)
  end

end

 # it { should_not allow_mass_assignment_of(:password) }



