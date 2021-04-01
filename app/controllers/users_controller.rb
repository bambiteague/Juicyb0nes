class UsersController < ApplicationController
  # handle Signup as well as editing or deleting a User account
    # IF LOGGED IN, DONT'T SHOW SIGNUP

  # sign up route FORM
  get '/signup' do 
      #render form
    redirect_if_logged_in
    erb :"users/new"
  end


  # signup route POST (create user and log them in)
  post '/signup' do
    # take data create a new USER
    redirect_if_logged_in
    user = User.new(params["user"])
    # if that user is valid, login, redirect '/costumes' (or wherever)
    if user.save
      session["user_id"] = user.id
      redirect "/homepage"
    # if user not valid, send back to '/signup'
    else
      # WILL WANT TO ADD A FLASH MESSAGE HERE!!!!!
      redirect "/signup"
    end
  end

end