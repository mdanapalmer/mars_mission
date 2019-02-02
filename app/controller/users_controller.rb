class UsersController < ApplicationController

	get '/signup' do 
		erb :'users/new.html'
	end

	get '/users' do 
		if !logged_in?
			redirect to '/login'
		else
			@spaceships = Spaceship.all
			@astronauts = Astronaut.all
		erb :'users/index.html'
	end
	end

	post '/users' do
		@user = User.create(:name => params[:name], :age => params[:age], :rank => params[:rank], :email => params[:email], :password => params[:password])
		session[:user_id] = @user.id
		erb :'users/show.html'
	end

end


