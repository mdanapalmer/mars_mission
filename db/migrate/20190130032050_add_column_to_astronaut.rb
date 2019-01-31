class AddColumnToAstronaut < ActiveRecord::Migration[5.2]
  def change
  	add_column :astronauts, :user_id, :integer
  end
end
