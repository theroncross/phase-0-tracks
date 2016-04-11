// Longest Word
//Set a temporary longest variable to the first word in the array
// Using .length on each string, compare each string to the temporary longest
// if the next word is longer, set the next word as temporary longest
// repeat until all words have been checked
// return the temporary longest
'use strict';

function longest(arr) {
  let temp_longest = arr[0];
  for(let i = 1; i < arr.length; i++) {
    if(arr[i].length > temp_longest.length) {
      temp_longest = arr[i];
    }
  }
  return temp_longest;
}

const names = ["Theron", "Jennifer", "Ethan"];
const cities = ["Los Angeles", "Houston", "Chicago", "New York"];
const numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"];

console.log(longest(names));
console.log(longest(cities));
console.log(longest(numbers));
