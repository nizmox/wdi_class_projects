//build our template function
$(document).ready(function () {
  //get out template html and generate template function
  var post_template = $('#post').html()
  var template = Handlebars.compile( post_template );

  //fetch the post data as json and display on the page
  $.getJSON('/posts.json', function (data) {

    // for (var i = 0; i < data.length; i++) {
      var html = template( {posts: data});
      $('#posts_container').append(html);
    // }
    
  });
});
