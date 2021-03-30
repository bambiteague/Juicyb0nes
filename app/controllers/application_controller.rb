require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get "/" do
   erb :search
  end

  get '/search' do
    @costumes  = Costumes.find_by(name: params["name"])
    erb :results
  end

end
