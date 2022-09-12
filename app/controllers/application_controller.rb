require "./config/environment"

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

   
 # Add your routes here
  get "/" do
    { message: "Hello, User!" }.to_json
  end

  get "/users" do
    user = User.all
    user.to_json
  end
 
  get "/restaurant" do
    restaurant = Restaurant.all
    restaurant.to_json
  end

  get "/restaurant/:restaurant_name" do
  
    restaurant = Restaurant.find(params[:restaurant_name])
    restaurant.to_json
  end

  get "/reviews" do
    review = Review.all
    review.to_json
  end

  post "/reviews" do
    review = Review.create(
      name: params[:restaurant_name],
      rating: params[:rating],
      feedback: params[:feedback]
    )
    review.to_json
  end

  delete "/reviews/:restaurant_name/delete" do
    review = Review.find(params[:restaurant_name])
    review.destroy

    redirect "/reviews"

  end


  patch "/reviews/:restaurant_name" do

    review = Review.find(params[:restaurant_name])
    review.update(
      name: params[:restaurant_name]
      rating: params[:rating],
      feedback: params[:feedback] 
    )
    review.to_json
  end

end




