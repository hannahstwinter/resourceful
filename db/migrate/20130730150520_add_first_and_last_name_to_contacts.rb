class AddFirstAndLastNameToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :first_name, :string
    add_column :contacts, :last_name, :string
  end
end
