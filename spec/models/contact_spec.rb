require 'spec_helper.rb'

describe Contact do
  it { should belong_to(:user) }
  it { should validate_presence_of(:agency_id) }
  it { should validate_presence_of(:user_id) }
  it { should validate_numericality_of(:user_id) }
  it { should validate_numericality_of(:agency_id) }

  it "returns search results" do
    user = User.create!(name: "awesomest user", email: "awesomest@user.com", password: "awesome", authz: "admin")
    bob = Contact.create!(first_name: "bob", last_name: "smith", agency_id: 4, user_id: user.id)
    sue = Contact.create!(first_name: "sue", last_name: "zimmerman", agency_id: 4, user_id: user.id)
    expect(Contact.search('sue', user.id)).to eq([sue])
    user.destroy
    bob.destroy
    sue.destroy
  end

  it "compiles ordered list of user's contacts" do
    user = User.create!(name: "awesomest user", email: "awesomest@user.com", password: "awesome", authz: "admin")
    bob0 = Contact.create!(first_name: "bob", last_name: "a", agency_id: 4, user_id: user.id)
    bob1 = Contact.create!(first_name: "bob", last_name: "b", agency_id: 4, user_id: user.id)
    expect(Contact.display(user.id)).to eq([bob0, bob1])
    user.destroy
    bob0.destroy
    bob1.destroy
    # that's an order...
  end
end




