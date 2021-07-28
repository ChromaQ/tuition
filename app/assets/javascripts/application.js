//= require jquery3.min
//= require rails-ujs
//= require popper
// require jquery_ujs <-- disabled here because it's in the head and causes console errors
//= require jquery-ui
//= require bootstrap
//= require bootstrap3-typeahead.min
//= require bootstrap-autocomplete-input
//= require bootstrap-autocomplete-input-init-turbolinks
//= require turbolinks
//= require activestorage
//= require_tree .


$(document).on("turbolinks:load",function(){
  // this will dismiss any and all flash alerts after 6 seconds
  // window.setTimeout(function() {
  //   $(".alert").fadeTo(1000, 0).slideUp(1000, function(){
  //     $(this).remove();
  //   });
  // }, 20000);

  autocomplete_init();
});
