class User < ActiveRecord::Base
    extend Memorable::ClassMethods
    include Memorable::InstanceMethods
  
    #validates_presence_of :name, :email, :country
    validates :name, uniqueness: true
    validates :email, uniqueness: true
    
    has_many :reviews
    has_many :restaurants, through: :reviews
    
end