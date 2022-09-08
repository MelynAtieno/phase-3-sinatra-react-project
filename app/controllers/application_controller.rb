require "./config/environment"

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    #set :session_secret, "password_security"
    register Sinatra::Flash
  end

 
  
  # Add your routes here
  get "/" do
    { message: "Hello, User!" }.to_json
 end

 

  def user_session(session)
    @user = User.find_by_id(session[:user_id])
  end

  def is_logged_in?(session)
    !!session[:user_id]
  end

  def error_messages(instance)
    @error_messages = instance.errors.messages.map do |k,v|
      k = k.capitalize
      v = v[0]
      "#{k} #{v}. "
    end.join(" ")
  end


  def logged_in_verification
    if is_logged_in?(session)
      @user = current_user(session)
    else
      flash[:message] = "You must be logged in to access that page."
      redirect "/login"
    end
  end

  def read_only
    if !(@restaurant.creator_id == @review.user_id) 
       "readonly"
    end
  end

  def read_only_disabled
    if !(@restaurant.creator_id == @review.user_id) 
       "disabled"
    end
  end

  def no_access
    flash[:message] = "You do not have access to that page."
    redirect '/'
  end

  def access_verification(obj)
    if @user.id != obj.user_id
      no_access
    end
  end
end
  


end




