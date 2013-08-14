class AddUrlToAgencies < ActiveRecord::Migration

  def up
    add_column :agencies, :url, :string
  end

  def down
    remove_column :agencies, :url
  end

end
