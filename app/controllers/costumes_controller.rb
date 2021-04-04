class CostumesController < ApplicationController
  # READ all costumes
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

  # CREATE new costume (save in DB)
  post '/costumes' do
    redirect_if_not_logged_in
    costumes = Costume.new(params["costume"])  
    costumes.user_id = session["user_id"]
    if costumes.save
      redirect "/costumes/#{costumes.id}"
    else 
      redirect "costumes/new"
    end
  end

  # READ 1 costume
  get '/costumes/:id' do
    redirect_if_not_logged_in
    redirect_if_not_authorized  
    erb :'costumes/show'
  end 

  # UPDATE 1 costume (render form)
  get '/costumes/:id/edit' do
    redirect_if_not_logged_in
    redirect_if_not_authorized
    @costume = Costume.find_by_id(params[:id])
  erb :'costumes/edit'
end

  #UPDATE 1 costume (save in DB)
  patch '/costumes/:id' do
    redirect_if_not_logged_in
    redirect_if_not_authorized
    @costume = Costume.find_by_id(params[:id])
    @costume.name = params["name"]
    @costume.description = params["description"]
    @costume.save
    if @costume.update(params["costume"])
      redirect "/costumes/params[:id]"
    else                                      
      redirect "/costumes/#{@costume.id}/edit"
    end 
  end

  # DELETE 1 Costume
  delete '/costumes/:id' do
    redirect_if_not_authorized
    if logged_in?
      @costume = Costume.find_by_id(params[:id])
      if @costume.user == current_user
      @costume.destroy
      end
      redirect to '/costumes'
    else
      redirect to '/login'
    end
  end

  private

  def redirect_if_not_authorized
    @costume = Costume.find_by_id(params[:id])
      redirect '/costumes' unless @costume
    if @costume.user_id != session["user_id"]
      redirect "/costumes"
    end
  end

end