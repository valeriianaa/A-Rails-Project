# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require jquery.chained

$(document).ready ->
  $("#contacto_provincia_id").chained("#contacto_pais_id")
  $("#contacto_ciudad_id").chained("#contacto_pais_id, #contacto_provincia_id")