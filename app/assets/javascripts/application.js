// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .
//= require turbolinks


//JS for roster card

$( document ).ready(function() {
  
  var mainImage = $("#rosterImage");
  $("tr td a").hover(function(){
     var href = $(this).attr("data-iconRef");
      $("#rosterImage").attr("src",href)
  });
  
  
});

//end JS Roster Card