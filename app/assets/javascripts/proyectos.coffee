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

  Morris.Area
    element: 'acumulacion'
    data: $('#acumulacion').
    xkey: 'updated_at'
    ykeys: ['cantidad']
    labels: ['Estados']
  
  Morris.Area
    element: 'area-example'
    data: [
      { y: '2006', a: 100, b: 90, c: 75, d: 65 }
      { y: '2007', a: 75, b: 65, c: 100, d: 90  }
      { y: '2008', a: 50, b: 40, c: 75, d: 65 }
      { y: '2009', a: 75, b: 65, c: 100, d: 90 }
      { y: '2010', a: 50, b: 40, c: 75, d: 65 }
      { y: '2011', a: 75, b: 65 , c: 100, d: 90 }
    ]
    xkey: 'y'
    ykeys: ['a', 'b', 'c', 'd']
    labels: ['Series A', 'Series B', 'Series D', 'Series D']