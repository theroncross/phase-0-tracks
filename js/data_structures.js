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
