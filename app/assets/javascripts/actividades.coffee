# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


//= require jquery.chained
//= require select2


$(document).ready ->
  #$("#actividad_antecedente_id").select2 {}
  #$("#actividad_antecedente_id").chained("#actividad_etapa_id")
  actividades = $('#actividad_antecedente_id').html()
  $('#etapa_id').change ->
  	etapa = $('#etapa_id :selected').text()
  	options = $(actividades).filter((index)->
  		$(this).attr("label") is etapa)
  	if options
        $('#actividad_antecedente_id').html(options)
        #$('#actividad_ids').parent().show()
    else
        $('#actividad_antecedente_id').empty()
        #$('#empleado_ids').parent().hide()
  #$("#empleado_ids").trigger "change"
  return