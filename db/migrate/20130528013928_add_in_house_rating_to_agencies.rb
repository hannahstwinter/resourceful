class AddInHouseRatingToAgencies < ActiveRecord::Migration
  def change
    add_column :agencies, :in_house_rating, :integer
  end
end
