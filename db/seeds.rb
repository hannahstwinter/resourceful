# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'rubygems'
require 'faker'

# # NRVCS

# nrvcs = Agency.create!(:name => "New River Valley Community Services (NRVCS)",
#                        :street => "1006 E Main St.",
#                        :city => "Pulaski",
#                        :state => "Virginia",
#                        :short_description => "NRVCS provides crisis & family services, adult recovery & habilitation services, financial & administrative support services." ,
#                        :long_description => "New River Valley Community Services (NRVCS) is a public provider of behavioral health services to residents of the New River Valley. The agency serves children, adults and families by providing community-based programs for mental health, intellectual disabilities, substance use disorders, and related prevention services. Also, one of the workers there is really hot. Really, really hot.",
#                        :url => "www.nrvcs.org",
#                        :phone => "(540)994-5023",
#                        :tag => "child,family,rehabilitation,financial,crisis"
#                        )

# User.create!(name: "Hannah Winter", email: "hstwinter@gmail.com", password: "temp", agency_id: nrvcs.id)
# User.create!(name: "Sarah Winter", email: "winter.hs@gmail.com", password: "temp", agency_id: nrvcs.id)

# # Review

# 100.times do
#   body = Faker::Lorem.paragraph
#   agency_id = rand(14) + 1
#   user_id = rand(9) + 1
#   review = Review.create( :user_id => user_id,
#                           :agency_id => agency_id,
#                           :body => body
#                           )
# end

# # Agency

# tag_array = [ 'children',
#               'substance abuse',
#               'alcoholism',
#               'ptsd',
#               'trauma',
#               'hospice',
#               'GLBTQ',
#               'employment',
#               'health-care',
#               'womens health',
#               'immigration services'
#               ]

# 25.times do
#   name = Faker::Company.name
#   street = Faker::Address.street_address
#   city = Faker::Address.city
#   state = Faker::Address.state_abbr
#   phone = Faker::PhoneNumber.phone_number
#   short_description = Faker::Lorem.sentence
#   long_description = Faker::Lorem.paragraph
#   score = rand(25)
#   score1 = rand(25)
#   score2 = rand(25)
#   tags = tag_array.sample(3).join(",")
#   url = Faker::Internet.domain_name

#   agency = Agency.create( :name => name,
#                           :street => street,
#                           :city => city,
#                           :state => state,
#                           :phone => phone,
#                           :short_description => short_description,
#                           :long_description => long_description,
#                           :in_house_rating => score,
#                           :overall_rating => score1,
#                           :client_rating => score2,
#                           :tag => tags,
#                           :url => url
#                           )
# end

# # Contacts

# 6.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   phone = Faker::PhoneNumber.phone_number
#   text = Faker::Lorem.paragraph
#   user_id = (37..46).to_a.sample
#   agency_id = (21..36).to_a.sample()
#   agency_name = Agency.find(agency_id).name

#   Contact.create(:user_id => 28,
#                  :agency_id => agency_id,
#                  :first_name => first_name,
#                  :last_name => last_name,
#                  :phone => phone,
#                  :notes => text,
#                  :agency_name => agency_name
#                 )
# end

# # Votes

# 100.times do
#   vote = rand(5) + 1
#   user_id = (23..30).to_a.sample
#   agency_id = rand(25) + 1
#   user_agency_id = rand(25) + 1

#   Vote.create(:user_id => user_id,
#               :user_agency_id => user_agency_id,
#               :agency_id => agency_id,
#               :vote => vote
#              )
# end

# User.create!(name: "Hannah Winter", email: "han@me.com", password: "hannah", agency_id: 22)
# User.create!(name: "Hannah Winter", email: "hannah@han.com", password: "hannah", agency_id: 22)
# User.create!(name: "Hannah Winter", email: "han@nah.com", password: "hannah", agency_id: 22)
# User.create!(name: "Hannah Winter", email: "han@han.com", password: "hannah", agency_id: 22)
# User.create!(name: "Hannah Winter", email: "han@awesome.com", password: "hannah", agency_id: 22)
# User.create!(name: "Hannah Winter", email: "hannah@hannah.com", password: "hannah", agency_id: 22)
# User.create!(name: "Hannah Winter", email: "han@hannah.com", password: "hannah", agency_id: 22)
# User.create!(name: "Hannah Winter", email: "han@hahaha.com", password: "hannah", agency_id: 22)
