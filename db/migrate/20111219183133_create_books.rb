class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :autor_id
      t.integer :genre_id
      t.integer :year
      t.integer :sales

      t.timestamps
    end
  end
end
