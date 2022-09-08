# Seed your database here
user = User.create({name:"John", email:"john@john.com", country:"Ethiopia"})
user = User.create({name:"Felistus", email:"felistus@felistus.com", country:"Ghana"})
user = User.create({name: "Andrew", email:"andrew@gmail.com", country:"UK"})


restaurant = Restaurant.create({name:"Teule", contact: "00204", location: "Nairobi"})
restaurant = Restaurant.create({name:"Hella", contact:"45903", location:"Lagos"})
restaurant = Restaurant.create({name:"Fille", contact:"34990", location:"New York"})

rate = Rate.create({user_id: user.id, restaurant_id: restaurant.id, rating:"4"})
rate = Rate.create({user_id: user.id, restaurant_id: restaurant.id, rating:"3"})
rate = Rate.create({user_id: user.id, restaurant_id: restaurant.id, rating:"5"})

