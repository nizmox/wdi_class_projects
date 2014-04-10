// Given the following a triangle object like the one below, write the following functions:

// isEquilateral - Returns whether the triangle is equilateral or not
// isIsosceles - Returns whether the triangle is isosceles or not
// area - Calculates the area of the Triangle
// isObtuse - Returns whether the triangle is obtuse or not
// var triangle = {
//   sideA: 3,
//   sideB: 4,
//   sideC: 4
// };

var triangle = function (sideA, sideB, sideC) {
  return {
    //remember commas on each property except the last
    sideA: sideA,
    sideB: sideB,
    sideC: sideC,
    isEquilateral: function () {
      return (this.sideA === this.sideB && this.sideB === this.sideC);
    },
    isIsosceles: function () {
      return (this.sideA === this.sideB || this.sideA === this.sideC || this.sideB === this.sideC);
    },
    area: function () {
      var p = (this.sideA + this.sideB + this.sideC) / 2;
      var result = Math.sqrt(p * (p - this.sideA) * (p - this.sideB) * (p - this.sideC));
      return result;
    },
    isObtuse: function () {
      var sq = function (n) { return n * n; }; // Helper function.
      return sq(this.sideA) > (sq(this.sideB) + sq(this.sideC)) ||
             sq(this.sideB) > (sq(this.sideA) + sq(this.sideC)) ||
             sq(this.sideC) > (sq(this.sideA) + sq(this.sideB));
    },
    print: function() {
      console.log("Equilateral? " + this.isEquilateral());
      console.log("Isosceles? " + this.isIsosceles());
      console.log("Obtuse? " + this.isObtuse());
      console.log("Area: " + this.area());
    }
  };
};

console.log("3-4-4");
t1 = triangle(3,4,4);
t1.print();

console.log("----------------");
console.log("4-4-4");
t2 = triangle(4,4,4);
t2.print();

console.log("----------------");
console.log("3-3-5");
t3 = triangle(3,3,5);
t3.print();