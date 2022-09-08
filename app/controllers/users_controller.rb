class UsersController < ApplicationController
    get '/register' do
        if is_logged_in?(session)
          flash[:message] = "You are already logged in."
          redirect '/reviews'
        end
        
          erb :"/users/new"
    end

    post '/register' do
        
        if params[:user][:password] != params[:confirm_password]
          flash[:errors] = "Your passwords do not match.  Please try again."
          redirect '/register'
        end
       
    
        @user = User.create(params[:user])
        if @user.invalid? 
          
          error_messages(@user)
          flash[:errors] = @error_messages
    
          redirect '/register'
        else
          session[:user_id] = @user.id
          redirect "/reviews"
        end
    end

    get '/user/:slug' do
        logged_in_verification
    
        
        if @user == User.find_by_slug(params[:slug])
          @user_restaurants = @user.restaurants
          @user_reviews = @user.reviews
        else
          no_access
        end
        
        erb :"/users/show"
    end
  
end