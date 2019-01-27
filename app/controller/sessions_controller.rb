class SessionsController < ApplicationController

get '/login' do 
	erb :'sessions/login.html'
end

post '/sessions' do
	if session[:email] != nil
		redirect to '/posts'			
	else
		session[:email] = params[:email]
		redirect to '/login'
	end
end

get '/logout' do
	logout
	redirect to '/login'
end

end

