class ApplicationController < Sinatra::Base

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
		enable :sessions
		set :session_secret, "ad_astra"
	end

	get '/' do
		erb :index
	end

	helpers do 

	def logged_in?
		!!session[:user_id]
	end

	def logout!
		session.clear
	end

	def user_logged_in?
		if !logged_in?
			redirect to '/login'
		end
	end

	def current_user
		User.find(session[:user_id])
	end

end
end