var paragraphs = document.getElementsByTagName("h1");
var paragraph = 0;

var pinkify = setInterval(function() {
  paragraphs[paragraph].style.backgroundColor = "pink";
  paragraph++;
}, 3000);

setTimeout(function() {
  clearInterval(pinkify);
}, 13000);

function goAway() {
  if (this.style.color == 'blue') {
    this.style.color = 'yellow';
  } else {
    this.style.color = 'blue';
  }
}

for (var i = 0; i < paragraphs.length; i++) {
  paragraphs[i].addEventListener("mouseover", goAway);
}

// function comeBack() {
//   this.style.visibility = 'visible';
// }

// for (var i = 0; i < paragraphs.length; i++) {
//   paragraphs[i].addEventListener("mouseout", comeBack);
// }