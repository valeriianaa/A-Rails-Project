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
        $.post( "/pagos/ajax_gon_variables", $("form").serialize())
          .done (gon)->
            document.getElementById("proyecto-titulo").innerHTML = "Proyecto: " + String(gon.proyecto)
            document.getElementById("responsable-titulo").innerHTML = "Responsable del contrato: " + String(gon.responsable)
            document.getElementById("saldo-titulo").innerHTML = "Saldo de la cuenta: " + String(gon.saldo)
            $("#pago_persona_id").val(gon.responsable_id)
            $("#pago_cuenta_id").val(gon.cuenta_id)

  $('form').on 'click', '.remove_fields_pagos', (event) ->
    $trfieldset = $(this).parent().parent()
    $trfieldset.find('input[type=hidden]').val('1')
    $trfieldset.hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields_pagos', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $("#pagos-table > tbody").append($(this).data('fields').replace(regexp, time))
    event.preventDefault()
