class RestaurantsController < ApplicationController

get "/restaurants" do
    logged_in_verification
    @restaurants = Restaurant.all
    
    erb :"/restaurants/index"
end




get "/restaurants/:id" do
    logged_in_verification
    
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
    erb :"/restaurants/show"
end
end