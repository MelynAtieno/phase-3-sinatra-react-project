require "./config/environment"

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

   

 
  
  # Add your routes here
  get "/" do
    { message: "Hello, User!" }.to_json
 end
 
 get "/restaurant" do
  restaurant = Restaurant.all.order(:name)
  restaurant.to_json(include: :rating)
 end

 get "/reviews" do
  reviews=Reviews.all
  reviews.to_json
 end

 post "/reviews" do
  review = Review.create(params)
  review.to_json
 end

 delete '/reviews/:id' do
  review = Review.find(params[:id])
  company.destroy
  redirect "/reviews"

end

 

 

end




