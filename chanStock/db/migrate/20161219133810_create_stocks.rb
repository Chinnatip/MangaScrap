class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :trend
      t.string :bg

      t.timestamps
    end
  end
end
