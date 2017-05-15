# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require select2

$(document).ready ->
  $('#eventos_table').dataTable()
  $('#evento_persona_ids').select2
    placeholder: "Seleccione uno o varios contactos"
  $('#evento_especialidad_de_contacto_ids').select2
    placeholder: "Seleccione las especialidades que conformarán la temática del evento"
  $('#evento_proyecto_ids').select2
    placeholder: "Seleccione uno o varios proyectos"

  if $('#estadisticas').data('especialidades') != undefined
      Morris.Donut
          element: 'estadisticas'
          data: $('#estadisticas').data('especialidades')
          xkey: 'estadisticas'
          ykeys: $('#estadisticas').data('labels')
          labels: $('#estadisticas').data('labels')
          parseTime: false
  
