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
end