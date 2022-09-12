class Restaurant < ActiveRecord::Base
    #validates_presence_of :name, :contact, :city
    has_many :reviews
    has_many :users, through: :reviews
end