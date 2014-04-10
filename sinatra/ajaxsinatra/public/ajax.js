$(document).ready(function () {
  console.log("ajax.js file loaded");

  $('#number_getter').on('click',function () {
    var request = $.ajax({
      type: 'GET',
      url: '/random.json'
      //you can force it to parse as .json if the server does not specify what type of content it is
      // datatype: 'json'

    // on success, do this! (number will pass request.responseText)
    //if this is .json format it will automatically be parsed back to an object
    }).done(function (data) {
        // debugger;
        console.log("Ajax response text:", data);
        $('#number').html(data.number);
    }).done(function () { 
      console.log("Yay success!"); 
    // on failure do this
    }).fail(function () {
      $('#number').html(23);
    });
  });

  var $contactFrm = $('#contact');
  
  $contactFrm.on('submit',function (event) {
    event.preventDefault();
    $.ajax({
      type: 'POST',
      url: '/greeter',
      data: {
        first: $('[name="first"]').val(),
        surname: $('[name="surname"]').val()
      }
    }).done(function (resp) {
      $contactFrm.fadeOut();
      $('body').append("<p>" + resp + "</p>");
      console.log(resp);
    });
  });
});

//.done is a promise that will run when the ajax request completes. You can chain multiple .done functions so when your request completes multiple functions are executed.