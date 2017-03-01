# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require jquery.chained

$(document).ready ->
  if $('#velocidad').data('labels') != undefined

    $("#proyecto_provincia_id").chained("#proyecto_pais_id")
    $("#proyecto_ciudad_id").chained("#proyecto_pais_id, #proyecto_provincia_id")
    $("#proyecto_rol_de_empleado_id").chained("#proyecto_departamento_id")
    $("#proyecto_empleado_id").chained("#proyecto_departamento_id, #proyecto_rol_de_empleado_id")
    $('#proyectos_table').dataTable()
    $('#miembro_equipo_id').select2
      placeholder: "Seleccione uno o varios contactos..."  

    Morris.Area
      element: 'acumulativo'
      data: $('#acumulativo').data('actividades')
      xkey: 'semana'
      ykeys: ['To do', 'Doing', 'Done']
      labels: $('#velocidad').data('labels')
      parseTime: false

    Morris.Line
      element: 'velocidad'
      data: $('#velocidad').data('estados')
      xkey: 'semana'
      ykeys: ['To do', 'Doing', 'Done']
      labels: $('#velocidad').data('labels')
      parseTime: false

    