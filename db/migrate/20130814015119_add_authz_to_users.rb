class AddAuthzToUsers < ActiveRecord::Migration

  def up
    add_column :users, :authz, :string
  end

  def down
    remove_column :users, :authz
  end

end
