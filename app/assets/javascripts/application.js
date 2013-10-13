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
  el.scrollIntoView(true);
}

function activeContact(elID) {
  var el = document.getElementById(elID);
  $(el).removeClass("inactive");
}

function agencyKeyToggle() {
  $("#agency-key").slideToggle();
}

var slideCount = 0;

function slideDownAuthz(){
  if (slideCount%2==0)
  {
    $("#authz").animate({height: "125"}, 750);
    slideCount++;
  }
}

$(document).ready(function(){

  $("a#tag-search").click(function(){
    $(".tag-list").toggleClass("hidden")
  });

  $('div#color.clickable').click(function(){
    $('div#review.hidden').slideToggle('2000',"linear");
  });

  $('a.nav').click(function(e){
    e.preventDefault();
  });

  $('a.top').click(function(e){
    e.preventDefault();
    document.getElementById("head").scrollIntoView();
  });

  var counter = 0

  $("#agency_select").change(function(e){
    e.preventDefault();
    if (counter==0)
    {
      agencyKeyToggle();
      $("#authz").animate({height: "185"});
      counter++;
    }
    if ($("select option:selected").text() == "None")
    {
      agencyKeyToggle();
      $("#authz").animate({height: "125"});
      counter = 0;
    }
  });

})



