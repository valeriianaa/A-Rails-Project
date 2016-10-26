# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require jquery.chained

$(document).ready ->
  $("#proyecto_provincia_id").chained("#proyecto_pais_id")
  $("#proyecto_ciudad_id").chained("#proyecto_pais_id, #proyecto_provincia_id")
  $("#proyecto_empleado_id").chained("#proyecto_departamento_id, #proyecto_rol_de_empleado_id")

  # miembros_equipo = $('#miembro_equipo_ids').html()
  # 	options = $(miembros_equipo).filter((index)->
  # 		#$(this).attr("label") is departamento)
  # 	if options
  #       $('#miembro_equipo_ids').html(options)
  #       #$('#miembro_equipo_ids').parent().show()
  #   else
  #       $('#miembro_equipo_ids').empty()