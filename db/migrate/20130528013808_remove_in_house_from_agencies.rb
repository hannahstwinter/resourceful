class RemoveInHouseFromAgencies < ActiveRecord::Migration
  def up
    remove_column :agencies, :in_house_rating
  end

  def down
    add_column :agencies, :in_house_rating, :integer
  end
end
