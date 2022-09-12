class User < ActiveRecord::Base
  
    validates_presence_of :name, :email, :country
    validates :name, uniqueness: true
    validates :email, uniqueness: true
    
    
    has_many :reviews
    has_many :restaurants, through: :reviews
    
end