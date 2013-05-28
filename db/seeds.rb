# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'rubygems'
require 'faker'

tag_array = [ 'children',
              'substance abuse',
              'alcoholism',
              'ptsd',
              'trauma',
              'hospice',
              'GLBTQ',
              'employment',
              'health-care',
              'womens health',
              'immigration services'
              ]

25.times do
  name = Faker::Company.name
  street = Faker::Address.street_address
  city = Faker::Address.city
  state = Faker::Address.state_abbr
  phone = Faker::PhoneNumber.phone_number
  short_description = Faker::Lorem.sentence
  long_description = Faker::Lorem.paragraph
  score = rand(25)
  score1 = rand(25)
  score2 = rand(25)
  tags = tag_array.sample(3).join(",")

  agency = Agency.create( :name => name,
                          :street => street,
                          :city => city,
                          :state => state,
                          :phone => phone,
                          :short_description => short_description,
                          :long_description => long_description,
                          :in_house_rating => score,
                          :overall_rating => score1,
                          :client_rating => score2,
                          :tag => tags
                          )
end
