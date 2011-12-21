class CreateGenresBooks < ActiveRecord::Migration
  def change
    create_table :genres_books do |t|
      t.integer :genre_id
      t.integer :book_id

      t.timestamps
    end
  end
end
