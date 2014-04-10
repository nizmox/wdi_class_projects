// The Reading List

// Keep track of which books you read and which books you want to read!

// Create an array of objects, where each object describes a book and has properties for the title (a string), author (a string), and alreadyRead (a boolean indicating if you read it yet).
// Iterate through the array of books. For each book, log the book title and book author like so: "The Hobbit by J.R.R. Tolkien".
// Now use an if/else statement to change the output depending on whether you read it yet or not. If you read it, log a string like 'You already read "The Hobbit" by J.R.R. Tolkien', and if not, log a string like 'You still need to read "The Lord of the Rings" by J.R.R. Tolkien.'

// var book1 = {
//     key: value, //property1
//     key: value, //property2
//     key: value  //property3
// };


var Book = function (title, author, alreadyRead) {
  this.title = title;
  this.author = author;
  this.alreadyRead = alreadyRead;

  this.print = function () {
    if (this.alreadyRead) {
       console.log("You already read \"" + this.title +"\" by " + this.author + ".");
    } else {
       console.log("You still need to read \"" + this.title +"\" by " + this.author + ".");
    }
  };
};

var books = [];

books.push( new Book("A Game of Thrones", "George R. R. Martin", false) );
books.push( new Book("The Fellowship of the Ring", "J. R. R. Tolkien", true) );
books.push( new Book("A Cavern of Black Ice", "J.V. Jones", true) );

for (var i = 0; i < books.length; i++) {
  console.log(books[i].print());
}

var myClass = function(property1, property2) {
  return {
    //remember commas on each property except the last
    property: property1,
    property2: property2,
    myFunction: function () {
        //statements
    };
  };
}