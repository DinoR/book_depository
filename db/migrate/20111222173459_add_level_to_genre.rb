class AddLevelToGenre < ActiveRecord::Migration
  def change
    add_column :genres, :level, :integer
  end
end
