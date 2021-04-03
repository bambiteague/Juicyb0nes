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

  # <-------- huge issues getting these update and delete routes to work correctly and I'm still not sure why -------->

# UPDATE 1 costume (render form)
get '/costumes/:id/edit' do
  redirect_if_not_logged_in
  @costume = Costume.find_by_id(params[:id])
  erb :'costumes/edit'
end

  #UPDATE 1 costume (save in DB)
  patch '/costumes/:id' do
    redirect_if_not_logged_in
    @costume = Costume.find_by_id(params[:id])
    @costume.name = params["name"]
    @costume.description = params["description"]
   
    if @costume.update(params["costume"])
      redirect "/costumes"
    else                                      
      redirect "/costumes/#{@costume.id}/edit"
    end 
  end

  # DELETE 1 Costume
  delete '/costumes/:id' do
    if logged_in?
      @costume = Costume.find_by_id(params[:id])
      if @costume.user == current_user
      erb :'/costumes/show'
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
      redirect '/costumes/edit'
    if @costume.user_id != session["user_id"]
      redirect "/costumes"
    end
  end

end