require 'spec_helper.rb'

describe Contact do
  it { should belong_to(:user) }
  it { should validate_presence_of(:agency_id) }
  it { should validate_presence_of(:user_id) }
  it { should validate_numericality_of(:user_id) }
  it { should validate_numericality_of(:agency_id) }

  it "returns search results" do
    user = User.create!(name: "awesomest user", email: "awesomest@user.com", password: "awesome", authz: "admin")
    bob = Contact.create!(first_name: "bob", last_name: "bob", agency_id: 4, user_id: user.id)
    sue = Contact.create!(first_name: "sue", last_name: "sue", agency_id: 4, user_id: user.id)
    expect(Contact.search('bob', user.id)).to eq([bob])
  end

  it "compiles ordered list of user's contacts" do
    user = User.create!(name: "awesomest user", email: "awesomest@user.com", password: "awesome", authz: "admin")
    bob0 = Contact.create!(first_name: "bob", last_name: "a", agency_id: 4, user_id: user.id)
    bob1 = Contact.create!(first_name: "bob", last_name: "b", agency_id: 4, user_id: user.id)
    expect(Contact.display(user.id)).to eq([bob0, bob1])
  end

  it "updates contact.agency_id's to 'nil'" do
    bobbert = Contact.create!(first_name: "bob", last_name: "a", agency_id: 4, user_id: 33)
    updated = Contact.update_agency_id(bobbert.agency_id)
    expect(updated.first.agency_id).to eq(nil)
  end
end




