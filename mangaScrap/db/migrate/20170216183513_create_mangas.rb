class CreateMangas < ActiveRecord::Migration[5.0]
  def change
    create_table :mangas do |t|
      t.string :name
      t.integer :chapter
      t.integer :viewer
      t.string :source
      t.string :rating
      t.string :author

      t.timestamps
    end
  end
end
