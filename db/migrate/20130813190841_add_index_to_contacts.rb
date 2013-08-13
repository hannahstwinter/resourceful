class AddIndexToContacts < ActiveRecord::Migration

  def up
    add_index :contacts, :user_id
    add_index :contacts, :agency_id
  end

  def down
    remove_index :contacts, :column => :user_id
    remove_index :contacts, :column => :agency_id
  end

end
