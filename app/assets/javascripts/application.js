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
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.ui.all
//= require_tree .


$(function() {
       $( ".datepicker").datepicker({
               changeMonth: true,
               changeYear: true,
                //yearRange: '-100:+0',
                minDate: '1d',
                //maxDate: '-1d',
                showOn: "button",
                buttonImage: "/assets/calendar.png",
                buttonImageOnly: true,
                dateFormat: 'yy-mm-dd'
        });
});


$(function(){
    $('.alert').change(function(){
        $('.alert').slideUp("slow");
    });
});

$(function(){
    setTimeout($(".alert").fadeOut(4500),9500);
});

$('.oelo').click(function () {
    alert('Hooray!');
});
