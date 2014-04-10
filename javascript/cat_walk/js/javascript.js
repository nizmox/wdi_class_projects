// Add a script tag linking to an external Javascript file with your code.
// Create a variable to store a reference to the img.
// Change the style of the img to have a "left" of "0px", so that it starts at the left hand of the screens.
// Create a function called catWalk() that moves the cat 10 pixels to the right of where it started, by changing the "left" style property.
// Call that function every 50 milliseconds. Your cat should now be moving across the screen from left to right. Hurrah!

// Bonus #1: When the cat reaches the right-hand of the screen, restart them at the left hand side ("0px"). So they should keep walking from left to right across the screen, forever and ever.
// Bonus #2: When the cat reaches the right-hand of the screen, make them move backwards instead. They should keep walking back and forth forever and ever.
// Bonus #3: When the cat reaches the middle of the screen, replace the img with an image of a cat dancing, keep it dancing for 10 seconds, and then replace the img with the original image and have it continue the walk.

$(document).ready(function() {

  //-----------------
  // SETUP VARIABLES
  //-----------------

  var $cat = $('#cat');
  $cat.css('left','0px');
  var step = 10;
  var catDancingImage = 'http://img4.wikia.nocookie.net/__cb20130907224518/glee/images/f/f1/DANCING_KITTY_KAT.gif';
  var catWalkingImage = 'http://www.anniemation.com/clip_art/images/cat-walk.gif';

  //to store the cats current position with our function
  var curPos;
  //cat is 296px wide

  var catAnimate = function () {
    //update the cats current position
    curPos = parseInt($cat.css('left'));
    //determine the cats next position IF he walks
    var nextPos = curPos + step;

    //determine the position of the center of the cat image
    var catCenter = curPos + $cat.width() / 2;
    //determine the page center (can change if browser window resized)
    var pageCenter = window.innerWidth / 2;

    //check if the cat is in the center range (of 10 px)
    if (catCenter > pageCenter - 5 && catCenter < pageCenter + 4 ) {
      //log a message
      console.log("he's in the center OMG!");
      //stop the cat from walking
      window.clearInterval(timer);
      //start the cat dancing
      catDance();
    //if the cat is NOT going to walk offscreen
    } else if (nextPos >= 0 && (nextPos + $cat.width()) < window.innerWidth) {
      //make the cat walk
      catWalk();
    //the cat is about to walk off screen so turn him around
    } else {
      //flip the step to the inverse (so it walks backward instead of forward etc...)
      step = step * -1;
      //invert the cat image
      $cat.toggleClass('flipped');
      //log a message
      console.log("changing direction");
      //make the cat walk
      catWalk();
    }

  };

  var catWalk = function () {
    //move to the next position (this could be left or right depending on the step)
    $cat.css('left', curPos + step);
    //logt a message
    console.log("cat walked to " + (curPos + step));
  };

  var catDance = function () {
    //change the cat image
    $cat.attr('src',catDancingImage);
    //reset the timer
    window.setTimeout(setTimer, 5000);
  };

  //---------------
  // TIMER RELATED
  //---------------

  var setTimer = function () {
    console.log("resetting timer");
    //change cat back to the walking animation
    $cat.attr('src',catWalkingImage);
    //walk the cat once (so he doesn't get stuck in another dance)
    catWalk();
    //setup a new cat walk timer
    timer = window.setInterval(catAnimate, 50);
  };

  var timer = window.setInterval(catAnimate, 50);

});