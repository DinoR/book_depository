class AddSingleNameColumnToAuthors < ActiveRecord::Migration
  def change
    remove_column :authors, :first_name, :string
    remove_column :authors, :last_name, :string
    add_column :authors, :name, :string
  end
end
