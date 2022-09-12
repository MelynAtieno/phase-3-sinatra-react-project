class Review < ActiveRecord::Base
    validates_presence_of :rating, :feedback, :restaurant_name
    belongs_to :user
    belongs_to :restaurant
end