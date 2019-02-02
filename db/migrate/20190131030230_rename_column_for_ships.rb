class RenameColumnForShips < ActiveRecord::Migration[5.2]
  def change
  	rename_column :spaceships, :type, :ship_type
  end
end
