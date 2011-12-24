class AddSingleNameColumnToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :name, :string
  end
end
