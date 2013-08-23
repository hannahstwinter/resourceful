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
    agency0 = Agency.create!(name: "agency0", street: "s", city: "s", state: "s", phone: "0000000000", short_description: "t", long_description: "t", tag: "tag", url: "s")
    agency1 = Agency.create!(name: "agency1", street: "s", city: "s", state: "s", phone: "0000000000", short_description: "t", long_description: "t", tag: "you're it", url: "s")
    agency2 = Agency.create!(name: "agency2", street: "s", city: "s", state: "s", phone: "0000000000", short_description: "t", long_description: "t", tag: "tag", url: "s")
    user = User.create!(name: "awesomest user", email: "awesomest@user.com", password: "awesome", authz: "admin")
    expect(Agency.search("tag", user, {})).to eq([agency0, agency2])
  end

  it "returns agencies with a similar name" do
    agency = Agency.create!(name: "agency", street: "s", city: "s", state: "s", phone: "0000000000", short_description: "t", long_description: "t", tag: "t", url: "s")
    expect(Agency.find_similar("agency")).to eq([agency])
  end

end

