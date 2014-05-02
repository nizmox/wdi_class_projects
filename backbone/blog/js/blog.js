//------------------------
// MODELS
//------------------------

var Post = Backbone.Model.extend({
  //use a slug instead of an id
  idAttribute: 'slug',
  //default values for a post model
  defaults: {
    title: 'New Post Title',
    content: 'New Post Content'
  }
});

var Posts = Backbone.Collection.extend({
  //which model does this collection contain
  model: Post
});

//create a collection object of posts and pass in an array of posts
var blogPosts = new Posts ([
  new Post({id: 1, title: 'Web Development', slug: 'web-dev', content: 'Lorem Ipsum'}),
  new Post({id: 2, title: 'Web Design', slug: 'web-design', content: 'Lorem Ipsum Ipsum'}),
  new Post({id: 3, title: 'Photography', slug: 'photos', content: 'Lorem IPSUM Ipsum Ipsum'}),
  new Post({id: 4, title: 'Coffee', slug: 'coffee', content: 'Lorem Coffee Ipsum'})
]);

//------------------------
// VIEWS
//------------------------
var AppView = Backbone.View.extend({
  //where to insert the content on the page
  el: '#main',
  initialize: function () {
    //generate an underscore template from our appView html template
    this.template = _.template($('#appView').html());
  },
  render: function () {
    // this.$el.html('is this thing on?');

    //select the jquery version of el and run the template and insert the html
    this.$el.html(this.template());

    this.collection.each(function (post) {
      var view = new PostListView({model: post});
      view.render();
      $('#posts').append(view.el);
    });
  }
});

//this view will just setup the html and not append it to the page
var PostListView = Backbone.View.extend({
  //whenever we instantiate this view, create an li
  tagName: 'li',

  initialize: function () {
    this.template = _.template($('#postListView').html());
  },
  render: function () {
    //this will get the jquery version of the li tag
    this.$el.html(this.template(this.model.toJSON()));
  },
  viewPost: function () {
    console.log('you clicked a post');
    router.navigate('posts/' + this.model.get('slug'), true);
  }
});

var PostView = Backbone.View.extend({
  el: '#main',
  initialize: function () {
    this.template = _.template($('#postView').html());
    this.render();
  },
  render: function () {
    this.$el.html(this.template(this.model.toJSON()));
  }
});

//------------------------
// ROUTER
//------------------------

var AppRouter = Backbone.Router.extend({
  routes: {
    '': 'index',
    'posts/:id': 'showPost',
    //to handle unknown routes
    '*anything': 'goHome'
  },

  index: function () {
    var view = new AppView({collection: blogPosts});
    view.render();
    console.log("you are at the index page");
  },

  showPost: function (slug) {
    // console.log("you have requested the post with id " + id);
    //get the blog post with the specified id
    var post = blogPosts.get(slug);
    new PostView({model: post});
  },

  goHome: function (anything) {
    console.log(404);
    //redirect back to homepage (change the url hash component to '')
    document.location.hash = '';
  }
});

//create an instance of our router
var router = new AppRouter();

//start backbone
$(document).ready(function () {
  Backbone.history.start();
});

