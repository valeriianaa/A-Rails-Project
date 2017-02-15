# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# //= require jquery.chained


$(document).ready ->
  $('#persona_id').hide()
  $('#persona_label').hide()
  personas = $('#persona_id').html()
  $('#proyecto_id').change ->
    $('#persona_id').show()
    $('#persona_label').show()
    proyecto = $('#proyecto_id :selected').text()
    options = $(personas).filter((index)->
      $(this).attr("label") is proyecto)
    if options
      $('#persona_id').html(options)
        #$('#actividad_antecedente_id').parent().show()
    else
      $('#persona_id').empty()