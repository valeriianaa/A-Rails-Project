# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require jquery.chained


$(document).ready ->
  $("#ciudad_provincia_id").chained("#ciudad_pais_id")
  $("#ciudades_table").dataTable()