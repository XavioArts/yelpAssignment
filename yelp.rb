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
# -print out just the name of res1 dishes (each loop) *****DONE
# -print out just the name of res1 dishes along with ingredients (nested each loop) *****DONE
# -create a function that takes a user and return a string with the users name and id *****DONE
# -create a method that takes a res and returns the menu of that res *****DONE
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
    restaurant[:dishes].each do |dish|
        puts dish[:name]
    end
end

# print_dish_name(res1)
# print_dish_name(res2)

def print_dish_ing(restaurant)
    restaurant[:dishes].each do |dish|
        puts "The dish is : #{dish[:name]}"
        puts "Ingredients:"
        dish[:ingredients].each do |ingredient|
            puts ingredient
        end
    end
end

# print_dish_ing(res1)
# print_dish_ing(res2)

def user_and_id(user)
    result = "#{user[:name]}, id no. #{user[:id]}"
end

# p user_and_id(user1)
# p user_and_id(user2)

# first try

def get_menu(restaurant)
    # first_name = restaurant[:dishes][0][:name]
    # second_name = restaurant[:dishes][1][:name]
    # first_price = restaurant[:dishes][0][:price]
    # second_price = restaurant[:dishes][1][:price]
    # result = "Menu\n#{first_name} - #{first_price}\n#{second_name} - #{second_price}"
    menu = "Menu: "
    restaurant[:dishes].each do |dish|
        menu = menu + dish[:name] + " "
        menu = menu + "#{dish[:price]} "
    end
    puts menu
end

### I like this way better

def get_menu_new(restaurant)
    array = ["Menu:"]
    dish_ingred = ""
    restaurant[:dishes].each do |dish|
        array << "#{dish[:name]} - #{dish[:price]}"
        dish[:ingredients].each do |ingredient|
            dish_ingred += ingredient + " "
        end
        array << dish_ingred
        dish_ingred = ""
    end
    puts array
end

# get_menu(res1)
# get_menu_new(res1)

def average_rev(restaurant)
    sum = 0
    restaurant[:reviews].each do |review|
        sum += review[:rating]
    end
    result = sum / restaurant[:reviews].length
end

# p average_rev(res1)
# p average_rev(res2)

res_array = [res1, res2]
@restaurant_array = [res1, res2]

# do C.R.U.D on ^this^ array (Create, Read, Update, Delete)
# new_res = {
#   id: 0,
#   name: "Blank Restaurant",
#   location: {
#     city: "",
#     state: "",
#   },
#   delivery: true,
#   days_open: "",
#   likes: 0,
#   dishes: [
#     { name: "", price: 0, ingredients: [] },
#     { name: "", price: 0, ingredients: [] },
#   ],
#   reviews: [
#     { user_id: 0, rating: 0 },
#     { user_id: 0, rating: 0 },
#   ],
# }

res3 = {
  id: 0,
  name: "Pickles",
  location: {
    city: "X",
    state: "X",
  },
  delivery: true,
  days_open: "2",
  likes: 0,
  dishes: [
    { name: "pIIckle", price: 200, ingredients: [] },
    { name: "pickle", price: 0, ingredients: [] },
  ],
  reviews: [
    { user_id: 1, rating: 10 },
    { user_id: 2, rating: 10 },
  ],
}

def add_res(restaurant)
    @restaurant_array << restaurant
end

def add_blank_res(array)
    new_index = array.length + 1
    new_res = {
    id: new_index,
    name: "Blank Restaurant",
    location: {
        city: "",
        state: "",
    },
    delivery: true,
    days_open: "",
    likes: 0,
    dishes: [
        { name: "", price: 0, ingredients: [] },
        { name: "", price: 0, ingredients: [] },
    ],
    reviews: [
        { user_id: 0, rating: 0 },
        { user_id: 0, rating: 0 },
    ],
    }
    array << new_res
    array
end

# add_blank_res(res_array)
# p add_res(res3)

# p add_blank_res(@restaurant_array)

def display_res(array, index)
    array[index].each_pair do |key, value|
        if (key == :location)
            loc = "#{key}: "
            value.each_value do |value|
                loc += "#{value} "
            end
            puts loc
        elsif (key == :dishes)
            ##puts "#{key}:"
            get_menu_new(array[index])
        elsif (key == :reviews)
            rev = "#{key}: "
            value.each do |review|
                review.each_pair do |key, value|
                    rev += "#{key} = #{value} "
                end
                rev += "| "
            end
            puts rev
        else
            puts "#{key}: #{value}"
        end
    end
end

# display_res(res_array, 0)
# display_res(res_array, 1)