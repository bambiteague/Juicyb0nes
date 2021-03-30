class CostumesController < ApplicationController
  # READ all costumes
  # right now this is boring/not useful. would like to turn into a part of the client's "homepage" that lets them view their current projects with me
  # alternatively, showing them all my current projects and the status of their order in my que of projects?
  get '/costumes' do
    redirect_if_not_logged_in
    @costumes = Costume.all
    erb :'costumes/index' 
  end

  # CREATE new costume (render form)
  get '/costumes/new' do
    redirect_if_not_logged_in
    erb :'costumes/new'
  end

  # READ 1 costume
  get '/costumes/:id' do
    redirect_if_not_logged_in
    redirect_if_not_authorized
    erb :'costumes/show'
  end 

  # CREATE new costume (save in DB)
  post '/costumes' do
    redirect_if_not_logged_in
    costumes = Costume.new(params["name"])
    costumes.user_id = session["user_id"]
    if costumes.save
      redirect "/costumes/#{costumes.id}"
    else
      redirect "costumes/new"
    end
  end

  # UPDATE 1 costume (render form)
  get '/costumes/:id/edit' do
    redirect_if_not_logged_in
    redirect_if_not_authorized
    erb :'costumes/edit'
  end

  #UPDATE 1 costume (save in DEB)
  patch '/costumes/:id' do
    redirect_if_not_logged_in
    redirect_if_not_authorized
    @costume.name = params["name"]
    if @costume.save
      redirect "/costumes/#{@costume.id}"
    else
      redirect "/costumes/#{@costume.id}/edit"
    end 
  end

  # DELETE 1 Costume
  delete '/costumes/:id' do
    redirect_if_not_logged_in
    redirect_if_not_authorized
    @costume.destroy
    redirect '/costumes'
  end

  private

  def redirect_if_not_authorized
    @costume = Costume.find_by_id(params[:id])
    if @costume.user_id != session["user_id"]
      redirect "/costumes"
    end
  end

end