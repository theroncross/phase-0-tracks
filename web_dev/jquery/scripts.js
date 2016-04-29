$(document).ready(function() {
  // add a div
  // $d = $('<div></div>');
  // $('body').append($d);

  // give it a size and color
  // $d.css({'height': '100px', 'width': '50px', 'background-color': 'blue'});
  // $d.css({ })

  // give it a class
  // $d.attr('class', 'box');

  // add three more divs
  var randomColor = function () { return '#'+(Math.random()*0xFFFFFF<<0).toString(16) };
  var randomSize = function () { return Math.floor(Math.random() * 150 + 50) + 'px' };
  var randomPosition = function() { return Math.floor(Math.random() * 800) };
  for (var i = 0; i < 30; i++) {
    $dd = $('<div></div>').attr('class', 'box');
    $dd.css({'background-color': randomColor, 'height': randomSize, 'width': randomSize});
    $dd.css({'position': 'relative', 'left': randomPosition, 'top': randomPosition});
    $dd.css({'display': 'inline-block'});
    $('body').append($dd);
  }

  // make them go home
  $('.box').bind('click', function() {
    $(this).animate({
      left: 0,
      top: 0}, 1000);
  });
});
