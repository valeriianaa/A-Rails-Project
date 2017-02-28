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

calcularTotales = ->
  total_cuotas = 0
  total_descuentos = 0
  total_a_pagar = 0
    
  $cuotas = $("#tabla_cuotas tr")
  $cuotas.slice(1, ($cuotas.size() - 1) ).each (index, value)->
      if $(value).find("input[type='checkbox']").is(":checked")
        # Obtengo el costo de la cuota
        cuota = parseInt($(value).data("montoTotal"))
        # Obtengo el porcentaje de descuento
        porcentaje_str = $(value).find('select[name$="[descuento_id]"] option:checked').data("porcentaje")
        # Me aseguro en caso de no seleccionar ninguna cuota
        porcentaje = 0
        if porcentaje_str != undefined
          porcentaje = parseInt(porcentaje_str)
        
        # Obtengo costo de la cuota con el descuento seleccionado
        cuota_con_descuento = cuota * (1 -  porcentaje/100)

        total_cuotas += cuota
        total_a_pagar += cuota_con_descuento
        total_descuentos += cuota - cuota_con_descuento
  [total_cuotas, total_descuentos, total_a_pagar]

setearTotales = ->
  [total_cuotas, total_descuentos, total_a_pagar] = calcularTotales()
  $("#total-cuotas").text("$ " + total_cuotas)
  $("#total-descuentos").text("$ " + total_descuentos)
  $("#total-a-pagar").text("$ " + total_a_pagar)

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

  $("form[id*='pago'][id!='new_tipo_de_pago']").on 'click', '.remove_fields_pagos', (event) ->
    $trfieldset = $(this).parent().parent()
    $trfieldset.find('input[type=hidden]').val('1')
    $trfieldset.hide()
    event.preventDefault()

  $("form[id*='pago'][id!='new_tipo_de_pago']").on 'click', '.add_fields_pagos', (event) ->
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

  $("form[id*='pago'][id!='new_tipo_de_pago']").on("mousedown", ".select-tipos-de-pagos", (event) ->
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
        
  click = false
  $("form[id*='pago'][id!='new_tipo_de_pago']").on("mousedown", "input[name='pago[cuota_por_cliente_ids][]'][type='checkbox']", (event)->
    last_indice = $("input[name='pago[cuota_por_cliente_ids][]'][type='checkbox']:checked:last").data("indice")
    if last_indice == undefined
      last_indice = -1

    if last_indice == ($(this).data("indice") - 1)
      click = true
    else if last_indice == $(this).data("indice") and $(this).is(':checked')
      click = true
    else
      click = false
  ).on "click", "input[name='pago[cuota_por_cliente_ids][]'][type='checkbox']", (event) ->
    if click == false
      alert("No puede selecionar una cuota que no sea consecutiva.")
      event.preventDefault()
    else
      setearTotales()


  $("form[id*='pago'][id!='new_tipo_de_pago']").on "change", 'select[name$="[descuento_id]"]', (event)-> 
    setearTotales()

  $("form[id*='pago'][id!='new_tipo_de_pago']").submit (event)->
    event.preventDefault()
    $.post( $(this).prop("action") + ".json", $("form").serialize())
      .fail (data)->
        if data.status == 422
          errores_html = '<div id="error_explanation">\
          <h2>COUNT error/es prohiben almacenar este Pago:</h2>\
          <ul>\
          ERRORES_DESCRIPCION\
          </ul>\
          </div>'
          error_html = '<li>DESCRIPCION</li>'
          errores_html = errores_html.replace(new RegExp('COUNT', 'g'), data.responseJSON.length)
          errores_descripcion_html = ''

          for error_descripcion in data.responseJSON
            errores_descripcion_html += error_html.replace(new RegExp('DESCRIPCION', 'g'), error_descripcion)

          errores_html = errores_html.replace(new RegExp('ERRORES_DESCRIPCION', 'g'), errores_descripcion_html)
          $("#messages").empty()
          $("#messages").append(errores_html)

          $('html, body').animate({
            scrollTop: $('section').offset().top
          }, 400);
        else if data.status == 201
          location.href = data.responseText