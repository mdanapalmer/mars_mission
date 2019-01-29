class ShipsController < ApplicationController

# new
	get '/spaceships/new' do
		user_logged_in?
      @spaceship = Spaceship.new
    erb :'ships/new.html'
	end

	# show
  get "/spaceships/:id" do
    user_logged_in?
    	@spaceship = Spaceship.find(params[:id])
    erb :'ships/show.html'
  end

  	# edit
	get '/spaceships/:id/edit' do
		user_logged_in?
			@spaceship = Spaceship.find(params[:id])
    	erb :'ships/edit.html'
	end

	# index
  get "/spaceships" do
    user_logged_in?
    	@spaceship = Spaceship.all
    erb :'ships/index.html'
  end

  # create
  post "/spaceships" do
    user_logged_in?
    @spaceship = Spaceship.create(params)
    redirect to "/spaceships/#{@spaceship.id}"
  end

  # update
  patch "/spaceships/:id" do
    user_logged_in?
    @spaceship = Spaceship.find(params[:id])
    @spaceship.update(params[:spaceship])
    redirect to "/spaceships/#{@spaceship.id}"
  end

  #destroy
  delete "/spaceships/:id" do
    user_logged_in?
    Spaceship.destroy(params[:id])
    redirect to "/spaceships"
  end

end