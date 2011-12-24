class AddDefaultValueYearsInBooks < ActiveRecord::Migration
  def up
    remove_column :books, :year, :integer
    add_column :books, :year, :integer, :default => 0
  end

  def down
  end
end
