class AddAgencyNameToContact < ActiveRecord::Migration

  def up
    add_column :contacts, :agency_name, :string
  end

  def down
    remove_column :contacts, :agency_name
  end

end
