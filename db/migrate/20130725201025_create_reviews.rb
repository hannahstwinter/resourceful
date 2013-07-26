class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :agency
      t.text :body
      t.timestamps
    end
  end
end
