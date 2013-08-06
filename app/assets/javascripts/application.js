// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
// = require jquery
//= require jquery_ujs
//= require_tree .

function showIt(elID) {
  var el = document.getElementById(elID);
  console.log("are we in here?");
  console.log(el)
  el.scrollIntoView(true);
}

$(document).ready(function(){

  $('div#color.clickable').click(function(){
    $('div#review.hidden').slideToggle('2000',"linear");
  });

  $('a.nav').click(function(e){
    e.preventDefault();
    console.log(this.id);
  });

  $('a.top').click(function(e){
    e.preventDefault();
    document.getElementById("head").scrollIntoView();
  });

  // $('a.uc-jump').click(function(e){
  //   console.log(this.id);
  //   var el = 'c ' + this.id + '';
  //   console.log(el);
  //   page.onload = function(){
  //     document.getElementById(el).scrollIntoView();
  //   };
  // });

})



