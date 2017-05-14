# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


//= require jquery.chained
//= require select2


$(document).ready ->
  $("#actividad_actividades_antecedentes").chained("#actividad_etapa_id")
  $("#actividad_etapa_id").select2
    placeholder: "Seleccione una etapa"
  $("#actividad_actividades_antecedentes").select2
    placeholder: "Seleccione una o varias actividades antecedentes"
  # $('#actividad_antecedente_id').hide()
  # $('#antecedente_label').hide()
  # actividades = $('#actividad_antecedente_id').html()
  # $('#etapa_id').change ->
  #   $('#actividad_antecedente_id').show()
  #   $('#antecedente_label').show()
  #   etapa = $('#etapa_id :selected').text()
  #   options = $(actividades).filter((index)->
  #     $(this).attr("label") is etapa)
  #   if options
  #     $('#actividad_antecedente_id').html(options)
  #   else
  #     $('#actividad_antecedente_id').empty()
  # return