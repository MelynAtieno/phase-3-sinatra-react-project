class ReviewsController < ApplicationController

    get "/reviews" do
        logged_in_verification
    
        @user = current_user(session)
        @reviews = Review.all
    end

    get "/reviews/new" do
        
        logged_in_verification
        
        erb :"/reviews/new"
    end

    post "/reviews" do
        
        logged_in_verification
    
        
        review = Review.new(params[:review])
        
        if params[:restaurant][:creator_id].empty?
          restaurant = Restaurant.new(params[:restaurant])
        else
          restaurant = Restaurant.find(params[:restaurant][:id])
        end
    
        
        if review.valid? && restaurant.valid?
          restaurant.creator_id = current_user(session).id
          restaurant.save
          review.restaurant_id = restaurant.id
          review.user_id = @user.id
          
          review.save
        else
          if review.invalid?
            error_messages(review)
            flash[:errors] = @error_messages
        end

        if restaurant.invalid?
            error_messages(restaurant)
            flash[:errors2] = @error_messages
          end
    
          redirect "reviews/new"
        end
    end
    
    get "/reviews/:id/edit" do

        logged_in_verification
        
        @review = Review.find(params[:id])
        @restaurant = @review.restaurant
        if @review.user_id != current_user(session).id
          redirect "/"
        else
          erb :"/reviews/edit"
        end
    end

    patch "/reviews/:id" do
        logged_in_verification
        @review = Review.find(params[:id])
        @restaurant = @review.restaurant
    
    
        access_verification(@review)
     
        if @restaurant.creator_id != @review.user_id
          @review.update(params[:review])
        else
          @restaurant.update(params[:restaurant])
          @review.update(params[:review])
        end
    
        redirect "/reviews/#{@review.id}"
    end

    get "/reviews/:id" do
        logged_in_verification
        @user = current_user(session)
        @review = Review.find(params[:id])
        
        erb :"/reviews/show"
    end
      
      
    delete "/reviews/:id/delete" do
        logged_in_verification
        @review = Review.find(params[:id])
    
        
        access_verification(@review)
        @review.destroy
    
        redirect "/reviews"
    end


end
      