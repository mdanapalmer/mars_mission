class AstronautsController < ApplicationController

	get '/posts/new' do
		if !logged_in?
			redirect '/login'
		else
			"A new post form."
		end
	end

	get '/posts' do 
		"A list of currently available astronauts"
	end

	get '/posts/:id/edit' do
		if !logged_in?
			redirect '/login'
		else
			"An edit astronaut form"
		end
	end	

end