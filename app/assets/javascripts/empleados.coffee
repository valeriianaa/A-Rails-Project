# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require jquery.chained

$(document).ready ->
  $("#empleado_provincia_id").chained("#empleado_pais_id")
  $("#empleado_ciudad_id").chained("#empleado_pais_id, #empleado_provincia_id")
  $("#empleado_rol_de_empleado_id").chained("#empleado_departamento_id")
  # $('#datetimepicker1').datetimepicker()
  # 	defaultDate: "05/11/2016"
  # 	format: 'DD/MM/YYYY'