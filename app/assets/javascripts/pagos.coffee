# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require jquery.chained

get_tp_ids = ->
  $(".select-tipos-de-pagos").filter((index, value)->
    $trfieldset = $(this).parent().parent()
    $trfieldset.find('input[type=hidden]').val() != "1"
  ).map (index, value)->
    $(value).val()

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
            $("#metodos-de-pago").data(gon)

            document.getElementById("proyecto-titulo").innerHTML = "Proyecto: " + String(gon.proyecto)
            document.getElementById("responsable-titulo").innerHTML = "Responsable del contrato: " + String(gon.responsable)
            document.getElementById("saldo-titulo").innerHTML = "Saldo de la cuenta: " + String(gon.saldo)
            $("#pago_persona_id").val(gon.responsable_id)
            $("#pago_cuenta_id").val(gon.cuenta_id)

            $("#pagos-table > tbody").empty()

  $('form').on 'click', '.remove_fields_pagos', (event) ->
    $trfieldset = $(this).parent().parent()
    $trfieldset.find('input[type=hidden]').val('1')
    $trfieldset.hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields_pagos', (event) ->
    if parseInt( $("#tipo_de_pago_size").val() ) > get_tp_ids().size()
      tp_ids = get_tp_ids()

      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')

      html = $.parseHTML( $(this).data('fields').replace(regexp, time) )
      $("#pagos-table > tbody").append(html)
      
      $(html).find("select option").each (index, value)->
        if $.inArray( $(value).val(), tp_ids )
          $input_monto = $(this).parent().parent().parent().find('input[type=text]')
          if $(this).val() == $("#tipo_de_pago_id").val()
            $input_monto
              .val( $("#metodos-de-pago").data().saldo )
              .prop('readonly', true)
          else
            $input_monto
              .val( "0" )
              .prop('readonly', false)
          
          $(value).attr('selected','selected')
    event.preventDefault()

  tp_ids = []

  $("form").on("mousedown", ".select-tipos-de-pagos", (event) ->
    $(this).data 'value', $(this).val()
    tp_ids = get_tp_ids()

  ).on "change", ".select-tipos-de-pagos", (event) ->
      prev_id = $(this).data("value")
      if ($.inArray( $(this).val(), tp_ids ) != -1)
        alert "Ya ha seleccionado este Tipo de Pago."
        $(this).val(prev_id)
        return false
      else
        $input_monto = $(this).parent().parent().find('input[type=text]')
        if $(this).val() == $("#tipo_de_pago_id").val()
          $input_monto
            .val( $("#metodos-de-pago").data().saldo )
            .prop('readonly', true)
        else
          $input_monto
            .val( "0" )
            .prop('readonly', false)
        
