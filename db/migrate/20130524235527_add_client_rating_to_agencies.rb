class AddClientRatingToAgencies < ActiveRecord::Migration
  def up
    add_column :agencies, :client_rating, :integer
  end

  def down
    remove_column :agencies, :client_rating
  end
end
