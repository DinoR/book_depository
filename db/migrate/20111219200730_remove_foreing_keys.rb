class RemoveForeingKeys < ActiveRecord::Migration
  def up
    remove_column :books, :author_id, :integer
    remove_column :books, :genre_id, :integer
    remove_column :authors, :book_id, :integer
    remove_column :genres, :book_id, :integer
  end

  def down
    remove_column :books, :author_id, :integer
    remove_column :books, :genre_id, :integer
    remove_column :authors, :book_id, :integer
    remove_column :genres, :book_id, :integer
  end
end
