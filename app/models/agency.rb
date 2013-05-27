class Agency < ActiveRecord::Base
  attr_accessible :city, :in_house, :long_description, :name, :out_of_house, :phone, :short_description, :state, :street, :tag

  def self.search(search, rating)
    if search
      if rating == "in_house"
        @agencies = Agency.where('tag LIKE ? OR name LIKE ?', "%#{search}%", "%#{search}%").order('in_house DESC')
      elsif rating == "out_of_house"
        @agencies = Agency.where('tag LIKE ? OR name LIKE ?', "%#{search}%", "%#{search}%").order('out_of_house DESC')
      elsif rating == "client"
        @agencies = Agency.where('tag LIKE ? OR name LIKE ?', "%#{search}%", "%#{search}%").order('client DESC')
      else
        @agencies = Agency.where('tag LIKE ? OR name LIKE ?', "%#{search}%", "%#{search}%")
      end
    else
      @agencies = Agency.order("out_of_house DESC").limit(5)
    end
  end

end
