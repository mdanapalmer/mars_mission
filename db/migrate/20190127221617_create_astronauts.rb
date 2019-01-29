class CreateAstronauts < ActiveRecord::Migration[5.2]
  def change
  	create_table :astronauts do |t|
  		t.string :name
  		t.integer :weight
  		t.integer :height
  		t.string :bio
  		t.string :nationality
  		t.string :specialty
  	end
  	
  end
end
