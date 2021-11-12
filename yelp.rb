# a resturuant looks like this
# res_data = {
#   id: INTEGER *MUST BE UNIQUE,
#   name: STRING,
#   location: {
#     city: STRING,
#     state: STRING,
#   },
#   delivery: BOOLEAN,
#   days_open: STRING *DAYS SEPERATED BY COMMAS(NO SPACES) ie 'mon,tue,wed',
#   likes: INTEGER,
#   dishes: ARRAY OF OBJECTS/HASHES
#     { name: STRING, price: FLOAT, ingredients: ARRAY OF STRINGS },
#   ],
#   reviews: ARRAY OF HASHES [
#     {user_id: INTEGER *id of user object, rating: INTEGER 0-5}
#   ]
# }

# -access user1 name through user1 ****DONE
# -access user1 name through res2 (user1 data is in reviews) ****DONE
# -access res1 reviews ****DONE
# -what does this output res1[:dishes]
#       It returns the array of hashes in the dishes of res1
# -print out just the name of res1 dishes (each loop)
# -print out just the name of res1 dishes along with ingredients (nested each loop)
# -create a function that takes a user and return a string with the users name and id
# -create a method that takes a res and returns the menu of that res
# -create that takes a res and returns average review
# -create an array of restaurants and do CRUD actions
# -a simple that takes a restaurants and adds to your array
#      a simple that takes restaurants and updates that to your array
# -loop through your restaurants and return those with likes > 500 (select/filter)
# -I want to think of ideas simple/hard and through them in slack
# -more to come
# -No interaction with terminal


user1 = {
  id: 1,
  name: "Tony",
}
user2 = {
  id: 2,
  name: "Sally",
}
res1 = {
  id: 1,
  name: "Spicy Thai",
  location: {
    city: "SLC",
    state: "UT",
  },
  delivery: true,
  days_open: "mon,tues,wed,thur,fri,sat,sun",
  likes: 1000,
  dishes: [
    { name: "Pad Thai", price: 10.25, ingredients: ["noddles", "peppers"] },
    { name: "Drunken Noodle", price: 9.25, ingredients: ["noddles", "chicken"] },
  ],
  reviews: [
    { user_id: 1, rating: 5 },
    { user_id: 2, rating: 3 },
  ],
}
res2 = {
  id: 2,
  name: "Albertos",
  location: {
    city: "SLC",
    state: "UT",
  },
  delivery: false,
  days_open: "mon,tues,wed,thur,fri,sat",
  likes: 500,
  dishes: [
    { name: "Tacos", price: 8.25, ingredients: ["tortilla", "carne"] },
    { name: "Quesidalla", price: 9.25, ingredients: ["tortilla", "cheese"] },
  ],
  reviews: [
    { user_id: 1, rating: 2 },
    { user_id: 2, rating: 4 },
  ],
}

def access_user_name(user)
    result = user[:name]
end

# p access_user_name(user1)
# p access_user_name(user2)

@users = [user1, user2]

def access_review_name(restaurant)
    result = ""
    id = restaurant[:reviews][1][:user_id]
    @users.each do |user|
        if user[:id] == id
            result = user[:name]
            break
        end
    end
    result
end

# p access_review_name(res2)

def access_reviews(restaurant)
    result = restaurant[:reviews]
end

# p access_reviews(res1)
# p access_reviews(res2)

def print_dish_name(restaurant)
    
end
