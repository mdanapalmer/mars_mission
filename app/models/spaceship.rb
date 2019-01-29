class Spaceship < ActiveRecord::Base

	belongs_to :user
  has_many :astronauts
end
