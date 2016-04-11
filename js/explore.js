// declare the function and its parameters
// starting with the last letter, and for each letter
// add the letters to a new string
// return the new string

'use strict';

function reverse(string) {
  let newString = '';
  for(let i = string.length - 1; i >= 0; i--) {
    newString += string[i];
  }
  return newString;
}

const reversedString = reverse('This string is reversed');

if(1 + 1 === 2) {
  console.log(reversedString);
}

