class User < ActiveRecord::Base
  has_secure_password
  #METHODS
  # password=
  # authenticate
  # password_confirmation=
  
  has_many :costumes
end