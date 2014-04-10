// What number's bigger?

// Write a function named greaterNum that:
// takes 2 arguments, both numbers.
// returns whichever number is the greater (higher) number.
// Call that function 2 times with different number pairs, and log the output to make sure it works (e.g. "The greater number of 5 and 10 is 10.").

var greaterNum = function(num1,num2) {
  if(num1 > num2) {
    return num1;
  } else {
    return num2;
  };
};

var greatest = greaterNum(5,10);
console.log("The greater number is " + greatest);
var greatest = greaterNum(8,3);
console.log("The greater number is " + greatest);

// The World Translator

// Write a function named helloWorld that:
// takes 1 argument, a language code (e.g. "es", "de", "en")
// returns "Hello, World" for the given language, for atleast 3 languages. It should default to returning English.
// Call that function for each of the supported languages and log the result to make sure it works.

var helloWorld = function(languageCode) {
  if(languageCode == "es") {
    return "Hola!";
  } else if(languageCode == "fr") {
    return "Bonjour!";
  } else if(languageCode == "de") {
    return "Guten tag!";
  } else {
    return "Hello!";
  };
};

var text = helloWorld("es");
console.log(text);
var text = helloWorld("de");
console.log(text);
var text = helloWorld("cn");
console.log(text);

// The Grade Assigner

// Write a function named assignGrade that:
// takes 1 argument, a number score.
// returns a grade for the score, either "A", "B", "C", "D", or "F".
// Call that function for a few different scores and log the result to make sure it works.

var assignGrade = function(numberScore) {
  if (numberScore > 80) {
    return "A";
  } else if (numberScore > 65) { 
    return "B";
  } else if (numberScore > 50) { 
    return "C";
  } else if (numberScore > 40) { 
    return "D";
  } else { 
    return "E";
  };
};

var grade = assignGrade(66);
console.log(grade);
var grade = assignGrade(20);
console.log(grade);
var grade = assignGrade(55);
console.log(grade);

// The Pluralizer

// Write a function named pluralize that:
// takes 2 arguments, a noun and a number.
// returns the number and pluralized form, like "5 cats" or "1 dog".
// Call that function for a few different scores and log the result to make sure it works.
// Bonus: Make it handle a few collective nouns like "sheep" and "geese".

var pluralize = function(noun, number) {
  var text = number + " " + noun;
  if (number == 1) {
    return text;
  } else {
    return text + "s";
  };
};

text = pluralize('cat',5);
console.log(text);
text = pluralize('dog',1);
console.log(text);