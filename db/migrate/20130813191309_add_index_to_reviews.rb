class AddIndexToReviews < ActiveRecord::Migration

  def up
    add_index :reviews, :user_id
    add_index :reviews, :agency_id
  end

  def down
    remove_index :reviews, :column => :user_id
    remove_index :reviews, :column => :agency_id
  end

end
