class CreateSpaceships < ActiveRecord::Migration[5.2]
  def change

  	create_table :spaceships do |t|
  		t.string :name
  		t.string :type
  		t.string :speed
  		t.string :crew
  		t.string :cargo
  	end

  end
end
