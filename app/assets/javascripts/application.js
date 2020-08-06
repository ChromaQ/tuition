//= require jquery3.min
//= require rails-ujs
//= require popper
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap
//= require turbolinks
//= require_tree .


$(document).on("turbolinks:load",function(){
  // this will dismiss any and all flash alerts after 3 seconds
  window.setTimeout(function() {
    $(".alert").fadeTo(1000, 0).slideUp(1000, function(){
      $(this).remove();
    });
  }, 3000);
});
