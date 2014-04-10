var square = function (length, width) {
  return {
    //remember commas on each property except the last
    length: length,
    width: width,
    isSquare: function () {
      return length === width;
    },

    area: function () {
      return length * width;
    },
    perimeter: function () {
      return (length * 2 + width * 2);
    }
  };
};

square = square(15,5);

console.log("Is a Square?: " + square.isSquare());
console.log("Area: " + square.area());
console.log("Perimeter: " + square.perimeter());