class AddRestaurantNameToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :restaurant_name, :string
  end
end
