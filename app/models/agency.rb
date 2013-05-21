class Agency < ActiveRecord::Base
  attr_accessible :city, :in_house, :long_description, :name, :out_of_house, :phone, :short_description, :state, :street
end
