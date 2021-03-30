class UsersController < ApplicationController
  # handle Signup as well as editing or deleting a User account

  # sign up route FORM
  get '/signup' do 
      #render form
    erb :"users/new"
  end


  # signup route POST (create user and log them in)
  post '/signup' do
    # take data create a new USER
    user = User.new(params["user"])
    # if that user is valid, login, redirect '/costumes' (or wherever)
    if user.save
      session["user_id"] = user.id
      redirect "/costumes"
    # if user not valid, send back to '/signup'
    else
      redirect "/signup"
    end
  end

end