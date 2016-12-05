# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


//= require jquery.chained
//= require select2


$(document).ready ->
  $('#actividad_antecedente_id').hide()
  $('#antecedente_label').hide()
  #$("#actividad_antecedente_id").select2 {}
  #$("#actividad_antecedente_id").chained("#actividad_etapa_id")
  actividades = $('#actividad_antecedente_id').html()
  $('#etapa_id').change ->
    $('#actividad_antecedente_id').show()
    $('#antecedente_label').show()
    etapa = $('#etapa_id :selected').text()
    options = $(actividades).filter((index)->
      $(this).attr("label") is etapa)
    if options
      $('#actividad_antecedente_id').html(options)
        #$('#actividad_antecedente_id').parent().show()
    else
      $('#actividad_antecedente_id').empty()
        #$('#actividad_antecedente_id').parent().hide()
        #$("#empleado_ids").trigger "change"
  return