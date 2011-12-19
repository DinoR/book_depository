class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :genre
      t.integer :book_id

      t.timestamps
    end
  end
end
