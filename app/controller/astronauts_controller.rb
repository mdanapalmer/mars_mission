class AstronautsController < ApplicationController

    #index - display all
  get "/astronauts" do
    user_logged_in?
    @astronauts = Astronaut.all
    erb :'astronauts/index.html'
  end

    #create new - process new astronauts form
  post "/astronauts" do
    user_logged_in?
    @astronaut = Astronaut.create(params)
    redirect "/astronauts/#{@astronaut.id}"
  end

    #new - new astronaut form
  get '/astronauts/new' do
    user_logged_in?
    erb :'astronauts/new.html'
  end

    #edit astronaut form load
   get '/astronauts/:id/edit' do
    user_logged_in?
    @astronaut = Astronaut.find(params[:id])
    erb :'astronauts/edit.html'
   end

    #Show newly created astronaut by ID
  get '/astronauts/:id' do
    user_logged_in?
    @astronaut = Astronaut.find_by_id(params[:id])
    erb :'astronauts/show.html'
  end

    #edit action
  patch '/astronauts/:id' do 
    user_logged_in?
    @astronaut = Astronaut.find(params[:id])
    @astronaut.update!(params[:astronaut])
    @astronaut.save
    redirect to "/astronauts/#{@astronaut.id}"
  end

    #delete astronaut
  delete "/astronauts/:id" do
    Astronaut.destroy(params[:id])
    redirect to "/astronauts"
  end

 end