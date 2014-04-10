//Excercise 1 - Why pay a fortune teller when you can just program your fortune yourself?

// Write a function named tellFortune that:
// takes 4 arguments: number of children, partner's name, geographic location, job title.
// outputs your fortune to the screen like so: "You will be a X in Y, and married to Z with N kids."
// Call that function 3 times with 3 different values for the arguments.

var tellFortune = function (numberOfChildren, partnersName, geographicLocation, jobTitle) {
  var text = "You will be a " + jobTitle + " in " + geographicLocation + ", and married to " + partnersName + " with " + numberOfChildren + " kids.";
  console.log(text);
};

tellFortune(0, "Pavitra", "Sydney", "Unemployed")
tellFortune(2, "Pavitra", "Sydney", "Senior Ruby Developer")


//Excercise 2 - Forgot how old you are? Calculate it!

// Write a function named calculateAge that:
// takes 2 arguments: birth year, current year.
// calculates the 2 possible ages based on those years.
// outputs the result to the screen like so: "You are either NN or NN"
// Call the function three times with different sets of values.
// Bonus: Figure out how to get the current year in JavaScript instead of passing it in.

var calculateAge = function(birthYear, year) {
  var age = year - birthYear;
  console.log("They are either " + (age - 1) + " or " + age);
};

calculateAge(1984,2014);
calculateAge(1982,2014);
calculateAge(1952,2014);

//Excercise 3 - Ever wonder how much a "lifetime supply" of your favorite snack is? Wonder no more!

// Write a function named calculateSupply that:
// takes 2 arguments: age, amount per day.
// calculates the amount consumed for rest of the life (based on a constant max age).
// outputs the result to the screen like so: "You will need NN to last you until the ripe old age of X"
// Call that function three times, passing in different values each time.
// Bonus: Accept floating point values for amount per day, and round the result to a round number.

var calculateSupply = function(age,amountPerDay) {
  var maxAge = 85
  var calc = (maxAge - age) * 365 * amountPerDay;
  console.log("You will need " + calc + " to last you until the ripe old age of " + maxAge);
};

calculateSupply(29,1.5);

//Excercise 4 - Create 2 functions that calculate properties of a circle, using the definitions here.

// Create a function called calcCircumfrence:
// Pass the radius to the function.
// Calculate the circumference based on the radius, and output "The circumference is NN".

// Create a function called calcArea:
// Pass the radius to the function.
// Calculate the area based on the radius, and output "The area is NN".

var calcCircumfrence = function (radius) {
  var circumference = radius * 2 * Math.PI;
  console.log("The circumference is " + circumference);
};

var calcArea = function (radius) {
  var area = radius * radius * Math.PI;
  console.log("The area is " + area);
};

calcCircumfrence(3.5);
calcArea(3.5);

//Excercise 5 - It's hot out! Let's make a converter based on the steps here.

// Create a function called celsiusToFahrenheit:
// Store a celsius temperature into a variable.
// Convert it to fahrenheit and output "NN°C is NN°F".

// Create a function called fahrenheitToCelsius:
// Now store a fahrenheit temperature into a variable.
// Convert it to celsius and output "NN°F is NN°C."

var celsiusToFahrenheit = function (temp) {
  var tempCelcius = temp;
  console.log(tempCelcius + "°C is " + (tempCelcius * 1.8 + 32) + "°F");
};

var fahrenheitToCelsius = function (temp) {
  var tempFahrenheit = temp;
  console.log(tempFahrenheit + "°F is " + (tempFahrenheit - 32) / 1.8 + "°C")
};

celsiusToFahrenheit(24);
fahrenheitToCelsius(75.2);




