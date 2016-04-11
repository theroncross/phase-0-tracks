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

// Find a Key-Value Match
// FOR EACH key in the first object
// IF the value in each object matches
// Return true immediately
// Return false after checking the last key in object 1

function matchingPairs(obj1, obj2) {
  for(let property in obj1) {
    if(obj1[property] == obj2[property]) {
      return true;
    }
  }
  return false;
}

const names = ["Theron", "Jennifer", "Ethan"];
const cities = ["Los Angeles", "Houston", "Chicago", "New York"];
const numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"];

console.log(longest(names));
console.log(longest(cities));
console.log(longest(numbers));

const theron = {name: 'Theron', weight: 175, gender: 'male'};
const jennifer = {name: 'Jennifer', weight: 130, gender: 'female'};
const ethan = {name: 'Ethan', weight: 130, gender: 'male'};

console.log(matchingPairs(theron, jennifer));
console.log(matchingPairs(jennifer, ethan));
console.log(matchingPairs(theron, ethan));