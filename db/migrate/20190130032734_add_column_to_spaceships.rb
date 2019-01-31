class AddColumnToSpaceships < ActiveRecord::Migration[5.2]
  def change
  	add_column :spaceships, :user_id, :integer
  end
end
