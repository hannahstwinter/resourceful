class AddOverallRatingToAgencies < ActiveRecord::Migration
  def change
    add_column :agencies, :overall_rating, :integer
  end
end
