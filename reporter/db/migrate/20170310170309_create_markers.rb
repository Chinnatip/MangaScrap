class CreateMarkers < ActiveRecord::Migration[5.0]
  def change
    create_table :markers do |t|
      t.string :name
      t.string :locaiton
      t.string :reporter
      t.string :typr
      t.integer :like
      t.integer :dislike
      t.integer :view

      t.timestamps
    end
  end
end
