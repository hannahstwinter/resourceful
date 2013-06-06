# require 'test_helper'

# class AgencyTest < ActiveSupport::TestCase
#   describe Agency do
#     it { should have_many(:votes) }
#     it { should have_many(:users) }
#     it { should validate_uniqueness_of(:name) }
#     it { should validate_presence_of(:name) }
#     it { should validate_presence_of(:street) }
#     it { should validate_presence_of(:city) }
#     it { should validate_presence_of(:state) }
#     it { should validate_presence_of(:short_description) }
#     it { should validate_presence_of(:tag) }
#     it { should validate_presence_of(:phone).with_message(/999-222-3333/) }
#     it { should_not allow_value("123").for(:phone) }
#     it { should allow_value("123-456.1234").for(:phone) }
#   end
# end

#  # it { should_not allow_mass_assignment_of(:password) }