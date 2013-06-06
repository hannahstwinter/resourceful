require 'spec_helper.rb'

describe Vote do
  it { should belong_to(:agency) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:user_agency_id) }
  it { should validate_presence_of(:agency_id) }
  it { should validate_presence_of(:vote) }
  it { should validate_numericality_of(:user_id) }
  it { should validate_numericality_of(:user_agency_id) }
  it { should validate_numericality_of(:agency_id) }
  it { should validate_numericality_of(:vote) }
  it { should validate_uniqueness_of(:user_id).scoped_to(:agency_id) }
end