# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require jquery.chained

$(document).ready ->
  $("#miembro_equipo_provincia_id").chained("#miembro_equipo_pais_id")
  $("#miembro_equipo_ciudad_id").chained("#miembro_equipo_pais_id, #miembro_equipo_provincia_id")