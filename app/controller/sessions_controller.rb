class SessionsController < ApplicationController

	get '/logout' do 
		logout!
		erb :'sessions/logout.html'
	end

	get '/login' do 
		erb :'sessions/login.html'
	end

	post '/sessions' do
		if login(params[:email], params[:password])
			redirect to '/posts'			
		else
			session[:email] = params[:email]
			redirect to '/login'
		end
	end
end


	







