require 'spec_helper.rb'

describe Contact do
  it { should belong_to(:user) }
  it { should validate_presence_of(:agency_id) }
  it { should validate_presence_of(:user_id) }
  it { should validate_numericality_of(:user_id) }
  it { should validate_numericality_of(:agency_id) }
end