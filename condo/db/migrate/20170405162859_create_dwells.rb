class CreateDwells < ActiveRecord::Migration[5.0]
  def change
    create_table :dwells do |t|
      t.string :name
      t.integer :price
      t.float :lattitude
      t.float :longitude
      t.integer :size
      t.integer :cost_per_size
      t.string :type
      t.integer :ref_id
      t.string :link

      t.timestamps
    end
  end
end
