require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get "/" do
   erb :'/index'
  end

  get "/search" do
    @costume = Costume.find_by(params["name"])
    if @costume != params["name"]
      not_found
    end
    erb :'/results'
  end


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

    not_found do
      status 404
      erb :error
    end
  end

end
