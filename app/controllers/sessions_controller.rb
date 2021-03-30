class SessionsController < ApplicationController
  # handles changing my session (IE login logout)


  # login route FORM
  get '/login' do
    erb :'sessions/new'
  end


  #login route POST
  post '/login' do
    # take data and find user
    user = User.find_by(email: params["user"]["email"])

    # if that user is authenticated, login, redirect to '/costumes'
    if user && user.authenticate(params["user"]["password"])
        session["user_id"] = user.id
        redirect "/costumes"
    # if not valid, send back to '/login'
    else
      redirect "/login"
    end
  end


  #logout (DELETE)
  delete '/logout' do
    
  end

end  