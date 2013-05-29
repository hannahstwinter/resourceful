class Agency < ActiveRecord::Base
  has_many :votes
  attr_accessible :city, :in_house_rating, :long_description, :name, :overall_rating, :client_rating, :phone, :short_description, :state, :street, :tag

  def self.search(search, rating)
    if search
      if rating == "in_house_rating"
        @agencies = Agency.where('tag LIKE ? OR name LIKE ?', "%#{search}%", "%#{search}%").order('in_house_rating DESC')
      elsif rating == "overall_rating"
        @agencies = Agency.where('tag LIKE ? OR name LIKE ?', "%#{search}%", "%#{search}%").order('overall_rating DESC')
      elsif rating == "client_rating"
        @agencies = Agency.where('tag LIKE ? OR name LIKE ?', "%#{search}%", "%#{search}%").order('client_rating DESC')
      else
        @agencies = Agency.where('tag LIKE ? OR name LIKE ?', "%#{search}%", "%#{search}%")
      end
    else
      @agencies = Agency.order("overall_rating DESC").limit(5)
    end
  end

end
