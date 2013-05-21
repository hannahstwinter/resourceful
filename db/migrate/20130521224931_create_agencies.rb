class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :phone
      t.text :short_description
      t.text :long_description
      t.integer :in_house
      t.integer :out_of_house

      t.timestamps
    end
  end
end
