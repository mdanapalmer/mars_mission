class SpaceshipsController < ApplicationController

# new
	get '/ships/new' do
    if logged_in?
      @spaceship = Spaceship.new
    erb :'ships/new.html'
    else
    erb :'error'
  end
end

	# show
  get "/ships/:id" do  
    if logged_in?
    	@spaceship = Spaceship.find(params[:id])
    erb :'ships/show.html'
    else
    erb :'error'
  end
end

  	# edit
	get '/ships/:id/edit' do
    if logged_in?
			@spaceship = Spaceship.find(params[:id])
    erb :'ships/edit.html'
    else
    erb :'error'
  end
end

	# index
  get '/ships' do
    if logged_in?
      @spaceships = current_user.spaceships     
    erb :'ships/index.html'
    else
    erb :'error'
  end
end

  # create
  post '/ships' do
    if logged_in?
      @spaceship = Spaceship.create(params)
    redirect to '/ships/#{@spaceship.id}'
    else
    erb :'error'
  end  
end

  # update
  patch '/ships/:id' do
    if logged_in?
      @spaceship = Spaceship.find(params[:id])
      @spaceship.update(params[:spaceship])
    redirect to "/ships/#{@spaceship.id}"
    else
    erb :'error'
  end
end

  #destroy
  delete "/ships/:id" do
    if logged_in?
    Spaceship.destroy(params[:id])
    redirect to "/ships"
  else
    erb :'error'
  end
end

end