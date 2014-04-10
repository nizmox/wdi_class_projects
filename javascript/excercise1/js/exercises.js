console.log('Hello World?');

//Excercise 1 - The Fortune Teller

// Why pay a fortune teller when you can just program your fortune yourself?

// Store the following into variables: number of children, partner's name, geographic location, job title. Output your fortune to the screen like so: "You will be a X in Y, and married to Z with N kids."

var numberOfChildren = 0;
var partnersName = "Pavitra";
var geographicLocation = "Sydney";
var jobTitle = "Unemployed";

var text = "You will be a " + jobTitle + " in " + geographicLocation + ", and married to " + partnersName + " with " + numberOfChildren + " kids.";

console.log(text);

//Excercise 2 - Forgot how old someone is? Calculate it!

//Store the current year in a variable. Store their birth year in a variable. Calculate their 2 possible ages based on the stored values. Output them to the screen like so: "They are either NN or NN", substituting the values.

var year = 2014;
var birthYear = 1984;

var age = year - birthYear;

console.log("They are either " + (age - 1) + " or " + age);

//Excercise 3 - Ever wonder how much a "lifetime supply" of your favorite snack is? Wonder no more!

// Store your current age into a variable. Store a maximum age into a variable. Store an estimated amount per day (as a number). Calculate how many you would eat total for the rest of your life. Output the result to the screen like so: "You will need NN to last you until the ripe old age of X".

var age = 29;
var maxAge = 85;
var coffeePerDay = 1.5;

var calc = (maxAge - age) * 365 * coffeePerDay;

console.log("I estimate you will have another " + calc + " coffees in your remaining lifetime");

//Excercise 4 - The Geometrizer

// Calculate properties of a circle, using the definitions here.

// Store a radius into a variable. Calculate the circumference based on the radius, and output "The circumference is NN". Calculate the area based on the radius, and output "The area is NN".

var radius = 15.6;
var circumference = radius * 2 * Math.PI;
var area = radius * radius * Math.PI;

console.log("The circumference of your circle with a radius of " + radius + " is " + circumference);
console.log("The area of your circle with a radius of " + radius + " is " + area);

//Excercise 5 - The Temperature Converter

// It's hot out! Let's make a converter based on the steps here.

// Store a celsius temperature into a variable. Convert it to fahrenheit and output "NN°C is NN°F". Now store a fahrenheit temperature into a variable. Convert it to celsius and output "NN°F is NN°C."

var tempCelcius = 24;
console.log(tempCelcius + "°C is " + (tempCelcius * 1.8 + 32) + "°F");

var tempFahrenheit = 75.2;
console.log(tempFahrenheit + "°F is " + (tempFahrenheit - 32) / 1.8 + "°C")



