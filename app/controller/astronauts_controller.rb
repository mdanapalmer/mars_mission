class AstronautsController < ApplicationController
  
    #new - new astronaut form
  get '/astronauts/new' do
    if logged_in?
      erb :'astronauts/new.html'
    else
      erb :'error'
  end
end
#create new - process new astronauts form
  post "/astronauts" do
    if logged_in?
    @astronaut = Astronaut.create(params[:astronaut])
    redirect "/astronauts/#{astronaut.id}"
  else
    erb :'error'
  end
 end  

  #index - display all
  get "/astronauts" do
    if logged_in?
 @astronauts = current_user.astronauts  
 erb :'astronauts/index.html'
  else
    erb :'error'
end
end 

  #edit astronaut form load
   get '/astronauts/:id/edit' do
    if logged_in?
    @astronauts = current_user.astronauts
    erb :'astronauts/edit.html'
  else
    erb :'error'
   end
end

#Show newly created astronaut by ID
  get '/astronauts/:id' do
    if logged_in?
    @astronaut = Astronaut.find(params[:id])
    erb :'astronauts/show.html'
  else
    erb :'error'
  end
end

 #edit action
  patch '/astronauts/:id' do 
    if logged_in?
    @astronaut = Astronaut.find(current_user.id)
    @astronaut.update(params[:astronaut])
    @astronaut.save
    redirect to '/astronauts/show'
  else
    erb :'error'
  end
end

    #delete astronaut
    delete "/astronauts/:id" do
      if logged_in?
    Astronaut.destroy(params[:id])
    redirect to "/astronauts"
    else
   erb :'error'
  end
end

 end