require 'spec_helper.rb'

describe User do
  it { should belong_to(:agency) }
  it { should have_many(:votes) }
  it { should have_many(:contacts) }
  it { should have_many(:reviews) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password) }
  it { should_not allow_value("bad_email").for(:email) }
  it { should allow_value("good@email.com").for(:email) }

  it "returns the role of the user" do
    user = User.create!(name: "awesomest user", email: "awesomest@user.com", password: "awesome", authz: "admin")
    expect(User.authz).to eq("admin")
  end

  it "verifies user authorization and assigns authz" do
    user = User.create!(name: "awesomest user", email: "awesomest@user.com", password: "awesome")
    return_user = User.authorize(user.id, "nrvcsbasic")
    expect(return_user.authz).to eq("basic")
  end

end
