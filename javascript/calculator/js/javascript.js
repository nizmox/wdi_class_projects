// Add a script tag, and add the functions.
// For each operation, create an event listener for the button, and when it's clicked, find the value of the appropriate input and show the result of the calculation in the solution div.
// Bonus: respond to key presses so that the user doesn't have to click the button.

window.onload = function () {
  var solution = document.getElementById('solution');

  var squareButton = document.getElementById('square-button');
  var halfButton = document.getElementById('half-button');
  var percentButton = document.getElementById('percent-button');
  var areaButton = document.getElementById('area-button');

  //helper functions
  var sq = function (value) {
    return value * value;
  };

  var setSolution = function (result) {
    solution.innerText = "Result : " + result;
  };

  //click functions
  var squareClick = function () {
    var squareInput = document.getElementById('square-input');
    var result = sq ( parseInt( squareInput.value ) );
    setSolution( result );
  };

  var halfClick = function () {
    var halfInput = document.getElementById('half-input');
    var result = parseInt( halfInput.value ) / 2;
    setSolution( result );
  };

  var percentClick = function () {
    var percentInputOne = document.getElementById('percent1-input');
    var percentInputTwo = document.getElementById('percent2-input');
    var result = (parseFloat(percentInputOne.value) / parseFloat(percentInputTwo.value)) * 100;
    setSolution( result + "%" );
  };

  var areaClick = function () {
    var areaInput = document.getElementById('area-input');
    var result = Math.PI * sq(parseFloat(areaInput.value));
    setSolution( result );
  };

  //event listeners
  squareButton.addEventListener('click', squareClick, false);
  halfButton.addEventListener('click', halfClick, false);
  percentButton.addEventListener('click', percentClick, false);
  areaButton.addEventListener('click', areaClick, false);
};