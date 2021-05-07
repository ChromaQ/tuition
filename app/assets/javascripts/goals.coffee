# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'change', '#degrees_select', (evt) ->
    $.ajax '/goals/update_credentials',
      type: 'GET'
      dataType: 'script'
      data: {
      degree_id: $("#degrees_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
        success: (data, textStatus, jqXHR) ->
          console.log("Dynamic degree select OK!")
