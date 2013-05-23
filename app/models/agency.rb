class Agency < ActiveRecord::Base
  attr_accessible :city, :in_house, :long_description, :name, :out_of_house, :phone, :short_description, :state, :street, :tag

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
