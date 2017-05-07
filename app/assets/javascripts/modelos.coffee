# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#modelos_table').dataTable()
  $('#accion_ids').select2
  	placeholder: "Seleccione una o varias Acciones"