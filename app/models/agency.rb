class Agency < ActiveRecord::Base
  attr_accessible :city, :in_house_rating, :long_description, :name, :overall_rating, :client_rating, :phone, :short_description, :state, :street, :tag
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

  def self.search(search, user_contacts, current_user)
    @agencies = Array.new
    agencies = Agency.where('tag like ? OR name like ?', "%#{search}%", "%#{search}%")
    if search && current_user != nil
      if user_contacts != nil
        agencies.each do |agency|
          if user_contacts.has_key?(agency.id)
            @agencies << agency
          end
        end
      end
      @agencies += agencies
      @agencies.uniq!
    else
      @agencies = Agency.order("created_at DESC").limit(5)
    end
    return @agencies
  end
end

 # it { should_not allow_mass_assignment_of(:password) }
