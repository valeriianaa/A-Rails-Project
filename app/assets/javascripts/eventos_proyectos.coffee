# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require select2

$(document).ready ->
  $('#eventos_proyectos_table').dataTable()
  $('#evento_proyecto_evento_id').select2
    placeholder: "Seleccione un evento"
  $('#evento_proyecto_proyecto_id').select2
    placeholder: "Seleccione un proyecto"