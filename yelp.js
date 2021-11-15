let user1 = {
    id: 1,
    name: "Tony",
};
let user2 = {
    id: 2,
    name: "Sally",
};

let res1 = {
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
};

let res2 = {
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
};

let users = [user1, user2]

const accessUserName = (user) => {
    let userName = user.name;
    return userName;
}

// console.log(accessUserName(user1));
// console.log(accessUserName(user2));

const accessReviewName = (res, array) => {
    let name = "";
    let id = res.reviews[0].user_id;
    array.forEach( user => {
        if (user.id === id) {
            name = user.name;
        }
    });
    return name;
}

// console.log(accessReviewName(res2, users));

const accessReviews = (res) => {
    let result = res.reviews;
    return result;
}

// console.log(accessReviews(res1));

const printDishName = (res) => {
    let dishes = "";
    res.dishes.forEach ( dish => {
        // console.log(dish.name);
        dishes += `${dish.name}` + " ";
    });
    return dishes;
}

// console.log(printDishName(res1));

const printDishIngred = (res) => {
    res.dishes.forEach (dish => {
        console.log(`${dish.name}:`);
        dish.ingredients.forEach (ingred => {
            console.log(ingred);
        });
    });
}

// printDishIngred(res2);

const userAndId = (user) => {
    let result = `${user.name}, id no. ${user.id}`;
    return result;
}

//console.log(userAndId(user1));

const getMenu = (res) => {
    let menu = "Menu: ";
    res.dishes.forEach (dish => {
        menu += `${dish.name} - $${dish.price} `;
    });
    return menu;
}

// console.log(getMenu(res1));

const averageReview = (res) => {
    let sum = 0;
    res.reviews.forEach (review => {
        sum += review.rating;
    });
    let result = sum / res.reviews.length;
    return result;
}

// console.log(averageReview(res1));
// console.log(averageReview(res2));

let resArray = [res1,res2];

// CRUD actions

let res3 = {
    id: 3,
    name: "Bob's burgers",
    location: {
      city: "Hell",
      state: "CA",
    },
    delivery: true,
    days_open: "mon,tues,wed,thur,fri,sat",
    likes: 65330,
    dishes: [
      { name: "Bread", price: 20.25, ingredients: ["tortilla", "carne"] },
      { name: "Water", price: 6.99, ingredients: ["tortilla", "cheese"] },
    ],
    reviews: [
      { user_id: 1, rating: 9 },
      { user_id: 2, rating: 6 },
    ],
};

const addRes = (res, array) => {
    array.push(res);
    return array;
}

console.log(resArray);
addRes(res3, resArray);
console.log(resArray);