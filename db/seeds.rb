# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do
# Farm.create!(name: "hello", country: "Colombia", price: 12, user_id: 1)
# end
# Users / Zaina
userOwner1 = User.new(email: "owner1@a.a", password: "password")
userOwner1.save!

userOwner2 = User.new(email: "owner2@a.a", password: "password")
userOwner2.save!

userGuest1 = User.new(email: "guest1@b.b", password: "password")
userGuest1.save!

userGuest2 = User.new(email: "guest2@c.c", password: "password")
userGuest2.save!

userGuest3 = User.new(email: "guest3@d.d", password: "password")
userGuest3.save!

userGuest4 = User.new(email: "guest4@e.e", password: "password")
userGuest4.save!


# Farms

farm1 = Farm.new(name: "Farm #1", description: "Description of the farm #1", location: "Location #1", city: "city", price: 100, country: "US")
farm1.user = userOwner1
farm1.save!

farm2 = Farm.new(name: "Farm #2", description: "Description of the farm #2", location: "Location #2", city: "city", price: 100,  country: "US")
farm2.user = userOwner2
farm2.save!

farm3 = Farm.new(name: "Farm #3", description: "Description of the farm #3", location: "Location #3", city: "city", price: 100,  country: "US")
farm3.user = userOwner1
farm3.save!


#Booking Farm 1
# start_date = Date.new(2018,1,1)
# end_date = Date.new(2018,1,31)
# user = userGuest1
# farm = farm1
# booking = Booking.new(start_date: start_date, end_date: end_date, user: user, farm: farm1)
# booking.save!

# start_date = Date.new(2018,2,1)
# end_date = Date.new(2018,2,15)
# user = userGuest2
# farm = farm1
# booking = Booking.new(start_date: start_date, end_date: end_date, user: user, farm: farm1)
# booking.save!

# start_date = Date.new(2018,3,1)
# end_date = Date.new(2018,3,15)
# user = userGuest1
# farm = farm1
# booking = Booking.new(start_date: start_date, end_date: end_date, user: user, farm: farm1)
# booking.save!

# start_date = Date.new(2018,1,1)
# end_date = Date.new(2018,1,15)
# user = userGuest2
# farm = farm2
# booking = Booking.new(start_date: start_date, end_date: end_date, user: user, farm: farm1)
# booking.save!

# start_date = Date.new(2018,2,1)
# end_date = Date.new(2018,2,15)
# user = userGuest3
# farm = farm2
# booking = Booking.new(start_date: start_date, end_date: end_date, user: user, farm: farm1)
# booking.save!


# start_date = Date.new(2018,1,1)
# end_date = Date.new(2018,3,31)
# user = userGuest4
# farm = farm3
# booking = Booking.new(start_date: start_date, end_date: end_date, user: user, farm: farm1)
# booking.save!

# # Cross  booking
# start_date = Date.new(2018,2,1)
# end_date = Date.new(2018,2,15)
# user = userOwner1
# farm = farm2
# booking = Booking.new(start_date: start_date, end_date: end_date, user: user, farm: farm1)
# booking.save!

# more booking seeds



15.times do
  booking = Booking.new(
    approved: rand(2) == 1 ? true : false,
    review: "slkjlskjdflksdjflkjslfdkjsdlfkjsdlkfjsdlkfjlsdkjflskjdflksdjfljsldkjflksjdflkjsdlfk",
    rating:  (0..5).to_a.sample,
    total_price: (100..250).to_a.sample,
    start_date: Faker::Date.backward(5),
    end_date: Faker::Date.forward(18),
    user_id: (1..4).to_a.sample,
    farm_id: (1..3).to_a.sample
  )
  booking.save!
end


photo_url = "https://images.unsplash.com/photo-1516467508483-a7212febe31a?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=187b9c5c4cab96d11794528ed75ce0d4&auto=format&fit=crop&w=2552&q=80"

Farm.all.each do |farm|
  farm.remote_photo_url =  photo_url
  farm.save!
end


