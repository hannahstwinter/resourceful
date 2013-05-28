class RemoveInHouseFromAgencies < ActiveRecord::Migration
  def up
    remove_column :agencies, :in_house
  end

  def down
    add_column :agencies, :in_house, :integer
  end
end
