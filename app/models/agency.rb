class Agency < ActiveRecord::Base
  attr_accessible :city, :in_house, :long_description, :name, :out_of_house, :phone, :short_description, :state, :street, :tag

  def self.search(search)
    if search
      @agencies = find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      @agencies = Agency.order("out_of_house DESC").limit(5)
    end
  end

end
