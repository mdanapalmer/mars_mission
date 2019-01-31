class UsersController < ApplicationController

	get '/signup' do 
		erb :'users/new.html'
	end

	get '/users' do 
		@user = User.find(params[:id])
		if !@user.nil? && @user == current_user
		erb :'users/index.html'
	end
	end

	post '/users' do
		@user = User.create(:name => params[:name], :age => params[:age], :rank => params[:rank], :email => params[:email], :password => params[:password])
		session[:user_id] = @user.id
		@user.save
		erb :'users/show.html'
	end

end


