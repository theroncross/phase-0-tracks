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

// Generate random test data
// initialize an empty array
// FOR the given number of iterations
// Initialize an empty string to store the random word
// generate a random length and store it in a variable
// FOR the length number of iterations
// randomly generate a number in the arabic letters unicode range
// Turn that number in the character that belongs to that code and concantenate it onto the random word variable
// Push the word into the array
// Return the array

function randomStrings(quantity) {
  const words = [];
  for(let i = 0; i < quantity; i++) {
    let word = "",
        charCode = 0,
        wordLength = Math.floor(10 * Math.random() + 1);
    for(let j = 0; j < wordLength; j++) {
      charCode = Math.floor(26 * Math.random() + 97);
      word += String.fromCharCode(charCode);
    }
    words.push(word);
  }
  return words;
}

// driver code for longest
const names = ["Theron", "Jennifer", "Ethan"];
const cities = ["Los Angeles", "Houston", "Chicago", "New York"];
const numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"];

console.log(longest(names));
console.log(longest(cities));
console.log(longest(numbers));

// driver code for matchingPairs
const theron = {name: 'Theron', weight: 175, gender: 'male'};
const jennifer = {name: 'Jennifer', weight: 130, gender: 'female'};
const ethan = {name: 'Ethan', weight: 130, gender: 'male'};

console.log(matchingPairs(theron, jennifer));
console.log(matchingPairs(jennifer, ethan));
console.log(matchingPairs(theron, ethan));

// driver code for randomStrings
let arrayLength = 0,
    arrayOfStrings = [];
for(let i = 0; i < 10; i++) {
  arrayLength = Math.floor(7 * Math.random() + 3);
  arrayOfStrings = randomStrings(arrayLength);
  console.log(arrayOfStrings);
  console.log(longest(arrayOfStrings));
}