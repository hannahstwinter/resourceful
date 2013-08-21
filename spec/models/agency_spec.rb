require 'spec_helper.rb'

describe Agency do
  it { should have_many(:votes) }
  it { should have_many(:users) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:street) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:short_description) }
  it { should validate_presence_of(:tag) }
  it { should validate_presence_of(:phone) }
  it { should_not allow_value("123").for(:phone) }
  it { should allow_value("(123-456.1234").for(:phone) }

  it "returns the users search results" do
    # @agencies = (1..3).collect { Factory(:agency) }
    user = User.create!(name: "awesomest user", email: "awesomest@user.com", password: "awesome", authz: "admin")
    expect(Agency.search()).to eq()
    user.destroy
  end

end

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
