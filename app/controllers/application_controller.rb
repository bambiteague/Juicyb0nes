require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get "/" do
   erb :'welcome'
  end

  # get "/search" do
  #   @costumes  = Costumes.find_by(name: params["name"])
  #   erb :'search'
  # end


  helpers do 
    def current_user
      # memoization
      @current_user ||= User.find_by_id(session["user_id"])
    end

    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      redirect "/login" if !logged_in?
    end

    def redirect_if_logged_in
      redirect "/costumes" if logged_in?
    end
  end

end
