class SessionsController < ApplicationController
  # handles changing my session (IE login logout)

  # login route FORM
  get '/login' do
    redirect_if_logged_in
    erb :'sessions/new'
  end

  #login route POST
  post '/login' do
    redirect_if_logged_in
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

  #logout a user (DELETE)
  delete '/logout' do
    redirect_if_not_logged_in
    session.clear
    redirect "/login"
  end

end  