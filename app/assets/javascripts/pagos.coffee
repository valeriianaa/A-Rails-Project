# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require jquery.chained

renovarIdProyecto = (numero) -> 
  elegirProyecto = $('#pago_proyecto_id').change ->
      numero = $('#pago_proyecto_id :selected').val()
      gon.proyecto = numero
      console.log(gon.proyecto)
      console.log(gon.cuotas)

gon.watch('proyecto', interval: 1000, renovarIdProyecto)

$(document).ready ->
  console.log(gon.proyecto)
  # $('#tabla_cuotas').hide()
  # elegirProyecto = $('#pago_proyecto_id').change ->
  #   proyecto = $('#pago_proyecto_id :selected').val()
    # console.log(proyecto)
  # if gon.proyecto != 1 
  #   $('#tabla_cuotas').show()