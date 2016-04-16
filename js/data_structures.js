// Arrays of colors and names
var colors = ["red", "blue", "gray", "purple"];
var horseNames = ["Ed", "Clovis", "Fred", "Joe"];
// Push new elements into each
colors.push("pink");
horseNames.push("Wendy");
// Log the results
console.log(colors);
console.log(horseNames);
// Create an object to store name: color pairs
var coloredHorses = {};
// For each name, add a name: color pair to the object
for (var i = 0; i < horseNames.length; i++) {
  coloredHorses[horseNames[i]] = colors[i];
}
console.log(coloredHorses);

// Create a car constructor function
function Car(color, interior) {
  this.color = color;
  this.interior = interior;

  this.revEngine = function() {
    console.log("REVVV");
  };
}
// Make some cars and rev the engines
console.log ("Let's build a car");
var newCar = new Car("black", "leather");
console.log("We built a " + newCar.color + " car with " + newCar.interior + " interior")
newCar.revEngine();

console.log ("Let's build a car");
var anotherNewCar = new Car("Gray", "Leather");
anotherNewCar.revEngine = function() { console.log("Vroom"); };
console.log("We built a " + anotherNewCar.color + " car with " + anotherNewCar.interior + " interior.");
anotherNewCar.revEngine();

console.log ("Let's build a car");
var yetAnotherNewCar = new Car("Pink", "Black Fabric");
console.log("We built a " + yetAnotherNewCar.color + " car with " + yetAnotherNewCar.interior + " interior")
yetAnotherNewCar.revEngine();