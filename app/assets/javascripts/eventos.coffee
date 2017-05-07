# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#eventos_table').dataTable()
  $('#evento_persona_id').select2
    placeholder: "Seleccione uno o varios contactos..."
  
