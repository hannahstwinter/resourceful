class RemoveOutOfHouseFromAgencies < ActiveRecord::Migration
  def up
    remove_column :agencies, :out_of_house
  end

  def down
    add_column :agencies, :out_of_house, :integer
  end
end
