# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#usuarios_table').dataTable()
  $('#user_persona_id').select2
  	placeholder: "Nombre y Apellido"