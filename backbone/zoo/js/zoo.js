id = 0;

//--------------------------
// MODELS
//--------------------------

// defining Animals model
var Animal = Backbone.Model.extend({
  defaults: {
    type: 'animal',
    ecosystem: '',
    stripes: 0,
  },

  //model refers to the current model (similar to self)
  initialize: function () {

    //set an animal ID on each animal
    this.set('animalID',id++);

    //this allows you to change the page, whenver the object changes in javascript memory
    // this.on("change:type", function (instance) {
    //   var type = instance.get("type");
    //   // alert("I am now a " + type);
    //     zooView.render();
    // });

    this.on("change:stripes", function (instance) {
      var stripes = instance.get("stripes");
      alert("I am now have " + stripes + " stripes!");
    });
  }
});

//--------------------------
// COLLECTION
//--------------------------

var Zoo = Backbone.Collection.extend({
  //only permit animals in this collection
  model: Animal
});

//--------------------------
// VIEWS
//--------------------------

var ZooView = Backbone.View.extend({
  //where to draw the view content
  el: '#main',

  initialize: function () {
    this.template = _.template($('#animal-template').html());
  },

  //how to draw the view
  render: function () {
    //get the jQuery version of the el (as above)
    this.$el.html('<h1>Welcome to the Zoo<h1>');
    this.$el.append('<ul id="animals"></ul>');
    //preserve the view (this is lost inside the each loop)
    var view = this;
    //collection refers to the collection that gets passed in when the view is created
    this.collection.each(function (animal) {
      //it is necessary to convert animal to json format
      $('#animals').append(view.template(animal.toJSON()));
    });
  }
});

var AnimalView = Backbone.View.extend({
  //where to draw the view content
  el: '#main',

  initialize: function () {
    this.template = _.template($('#animal-view-template').html());
  },

  //how to draw the view
  render: function () {
    //get the jQuery version of the el (as above)
    this.$el.html( this.template(this.model.toJSON()) );
  }
});

//--------------------------
// ROUTES
//--------------------------

var AppRouter = Backbone.Router.extend({
  routes: {
    //map routes to functions
    "": "index",
    "animals/:id": "viewAnimal"
  },
  index: function () {
    //create a new view and set the collection to myZoo
    var zooView = new ZooView({ collection: myZoo });
    //render the view
    zooView.render();
  },
  //since id is a variable in the route it must be included in the function
  viewAnimal: function (id) {
    // alert("viewing animal with id = " + id);
    var animalView = new AnimalView({model: myZoo.models[id]});
    animalView.render();
  }
});

//example code
// var animal = new Animal();
// var giraffe = new Animal({type: 'giraffe', ecosystem: 'savannah'});
// animal.set('type', 'bear');

var animal1 = new Animal({type: 'giraffe', ecosystem: 'savannah'});
var animal2 = new Animal({type: 'zebra', ecosystem: 'savannah', stripes: 12});
var animal3 = new Animal({type: 'giraffe', ecosystem: 'savannah'});

var myZoo = new Zoo([animal1, animal2, animal3]);
//you can then use myZoo.models[1] etc... to access the models

$(document).ready(function () {
  var router = new AppRouter();
  //start listening to changes in the url to determine route
  Backbone.history.start();
});

//examples of auto updating your view
// animal1.set('type', 'monkey');
// animal2.set('type', 'warthog');