class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.integer :agency_id
      t.text :notes

      t.timestamps
    end
  end
end
