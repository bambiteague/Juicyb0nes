
class HomepageController < ApplicationController
# manage the user's interactions with their homepage
# redirect here after login
# CRUD actions for:
  # - submitting an application (form) for a new project
  # - writing and submitting reviews (form)
  # - READ their commission status
  # - DELETE an application for a new project
  # - contact designer button? leads to form to send me an email on my business email ?

  get '/homepage' do
    redirect_if_not_logged_in
    erb :'/homepage/my_home'
  end

end