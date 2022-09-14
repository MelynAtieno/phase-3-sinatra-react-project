# Seed your database here
user = User.create({name:"John", email:"john@john.com", country:"Ethiopia"})
user = User.create({name:"Felistus", email:"felistus@felistus.com", country:"Ghana"})
user = User.create({name: "Andrew", email:"andrew@gmail.com", country:"UK"})


restaurant = Restaurant.create({name:"Teule", contact: "00204", city: "Nairobi"})
restaurant = Restaurant.create({name:"Hella", contact:"45903", city:"Lagos"})
restaurant = Restaurant.create({name:"Fille", contact:"34990", city:"New York"})

review = Review.create({user_id: user.id, restaurant_id: restaurant.id, restaurant_name:"Hella", rating:"4", feedback:"Good customer service!"})
review = Review.create({user_id: user.id, restaurant_id: restaurant.id, restaurant_name:"Teule",rating:"3", feedback:"I didn't like their fries"})
review = Review.create({user_id: user.id, restaurant_id: restaurant.id, restaurant_name:"Fille",rating:"5",feedback:"The ambience and the food portions are great!"})



   
