# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require jquery.chained


$(document).ready ->
  $("#metodos-de-pago").hide()
  $("#bt-filtrar").click ->
    $("#spin-ajax").show()
    $.post( "/pagos/ajax_table_cuotas", $("form").serialize())
      .done (data) ->
        $("#spin-ajax").hide()
        $("#cuotas-tabla").empty()
        $("#cuotas-tabla").append data
        $("#metodos-de-pago").show()