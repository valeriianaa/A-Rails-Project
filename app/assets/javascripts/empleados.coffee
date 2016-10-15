# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require jquery.chained

$(document).ready ->
  $("#empleado_provincia_id").chained("#empleado_pais_id")
  $("#empleado_ciudad_id").chained("#empleado_pais_id, #empleado_provincia_id")