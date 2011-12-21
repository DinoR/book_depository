class CreateAuthorsGenres < ActiveRecord::Migration
  def change
    create_table :authors_genres do |t|
      t.integer :author_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
