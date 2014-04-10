// Add a script tag that links to an external Javascript file for your code.
// Add an event listener to the button so that it calls a makeMadLib function when clicked.
// In the makeMadLib function, retrieve the current values of the form input elements, make a story from them, and output that in the story div (like "Pamela really likes pink cucumbers.")


//don't run our code until the page is loaded
window.onload = function () {
  var button = document.getElementById('lib-button');
  
  var noun = document.getElementById('noun');
  var adjective = document.getElementById('adjective');
  var person = document.getElementById('person');

  var story = document.getElementById('story');

  var click = function () {
    var divText = (person.value + " really likes " + adjective.value + " " + noun.value);
    console.log(divText);
    
    story.innerHTML = divText;
  };

  button.addEventListener('click', click, false);
}