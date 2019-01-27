class ApplicationController < Sinatra::Base

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
		enable :sessions
		set :session_secret, "carcollection"
	end

	helpers do 

		def logged_in?
			!!session[:email]
		end

		def login(email, password)
			user = User.find_by(:email => email) 
			if user && user.authenticate(password)
			session[:email] = params[:email]
			else
				redirect to '/login'
		end
	end
end

	def logout!
		session.clear
	end

end

