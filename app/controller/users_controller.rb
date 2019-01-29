class UsersController < ApplicationController

	get '/signup' do 
		erb :'user/new.html'
	end

	get '/users/:id/edit' do  #load edit form
    	@user = User.find_by_id(params[:id])
    	erb :'user/edit.html'
  	end
 
	patch '/users/:id' do #edit action
  		@article = Article.find_by_id(params[:id])
  		@article.title = params[:title]
  		@article.content = params[:content]
  		@article.save
  		redirect to "/users/#{@user.id}"
	end

	get '/users' do 
		erb :'user/show.html'
	end

	post '/users' do
		@user = User.create(:name => params[:name], :age => params[:age], :rank => params[:rank], :email => params[:email], :password => params[:password])
		session[:user_id] = @user.id
		@user.save
		erb :'user/show.html'
	end

end


