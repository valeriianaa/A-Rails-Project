# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require jquery.chained

$(document).ready ->
  $("#proyecto_provincia_id").chained("#proyecto_pais_id")
  $("#proyecto_ciudad_id").chained("#proyecto_pais_id, #proyecto_provincia_id")
  $("#proyecto_rol_de_empleado_id").chained("#proyecto_departamento_id")
  $("#proyecto_empleado_id").chained("#proyecto_departamento_id, #proyecto_rol_de_empleado_id")
  $('#proyectos_table').dataTable()  

  # Morris.Area
  #   element: 'acumulativo'
  #   data: $('#acumulativo').data('actividades')
  #   xkey: $('#acumulativo').data('fechas')
  #   ykeys: ['Done', 'Doing', 'To do']
  #   labels: ['Done', 'Doing', 'To do']
  #   parseTime: false

  # Morris.Line
  #   element: 'velocidad'
  #   data: $('#velocidad').data('estados')
  #   xkey: $('#velocidad').data('fechas')
  #   ykeys: ['To do', 'Doing', 'Done']
  #   labels: $('#velocidad').data('labels')
  #   parseTime: false

  