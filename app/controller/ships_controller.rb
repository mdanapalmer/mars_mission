class SpaceshipsController < ApplicationController

# new
	get '/ships/new' do
    if user_logged_in?
      erb :'error'
    else 
      @spaceship = Spaceship.new
    erb :'ships/new.html'
	end
end

	# show
  get "/ships/:id" do
    if user_logged_in?
      erb :'error'
    else  
    	@spaceship = Spaceship.find(params[:id])
    erb :'ships/show.html'
  end
end
  	# edit
	get '/ships/:id/edit' do
		if user_logged_in?
      erb :'error'
    else 
			@spaceship = Spaceship.find(params[:id])
    erb :'ships/edit.html'
	end
end
	# index
  get "/ships" do
    if logged_in?
      @spaceships = current_user.spaceships     
    erb :'ships/index.html'
  else
    erb :'error'
  end
end

  # create
  post "/ships" do
    if user_logged_in?
      erb :'error'
    else 
      @spaceship = Spaceship.create(params)
    redirect to "/ships/#{@spaceship.id}"
  end
end
  # update
  patch "/ships/:id" do
    if user_logged_in?
      erb :'error'
    else 
      @spaceship = Spaceship.find(params[:id])
      @spaceship.update(params[:spaceship])
    redirect to "/ships/#{@spaceship.id}"
  end
end
  #destroy
  delete "/ships/:id" do
    if user_logged_in?
      erb :'error'
    else 
    Spaceship.destroy(params[:id])
    redirect to "/ships"
  end
end


end