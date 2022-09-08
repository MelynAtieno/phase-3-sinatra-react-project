require "./config/environment"

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

 
  
  # Add your routes here
  get "/" do
    { message: "Hello, Voter!" }.to_json
  end
end

  #def user_session(session)
    #@user = User.find_by_id(session[:user_id])

#end


