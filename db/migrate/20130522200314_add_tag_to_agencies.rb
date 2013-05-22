class AddTagToAgencies < ActiveRecord::Migration
  def up
    change_table :agencies do |t|
      t.text :tag
    end
  end

  def down
    remove_column :agencies, :tag
  end

end
