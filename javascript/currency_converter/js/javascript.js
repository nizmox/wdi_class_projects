// Find the exchange rate between dollars and pounds
// Store the exchange rate in a variable
// Converting dollars to pounds:

// Store a dollar amount into a variable.
// Convert it to pounds and output "$NN is £NN".
// Converting pounds to dollars:

// Now store a pound amount into a variable.
// Convert it to dollar and output "£NN is $NN."
// Cleaning it up:

// Can you make sure the output is only 2 decimal places?
// Refactoring

// Can you refactor the code so that it uses functions? Write a function dollarsToPounds that takes a dollar number as input and outputs a string of what the pound equivalent is.
// Do the same for poundsToDollars

var convertAUDtoGBP = function(dollars) {
  var fxRate = 0.555236;
  var pounds = (dollars * fxRate).toFixed(2);
  console.log("$" + dollars + " is £" + pounds + ".");
};

var convertGBPtoAUD = function(pounds) {
  var fxRate = 1.80103;
  var dollars = (pounds * fxRate).toFixed(2);
  console.log("£" + pounds + " is $" + dollars + ".");
};

convertAUDtoGBP(100);
convertGBPtoAUD(56);