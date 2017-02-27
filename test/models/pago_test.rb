require "test_helper"

def pago_params(params)
  parametros = params.require(:pago).permit(
    :fecha, 
    :montoAcreditado, 
    :proyecto_id, 
    :persona_id, 
    :cuenta_id,
    :monto, 
    :cuota_por_cliente_ids => [],
    :pagos_metodos_attributes => [ :id, :monto, :pago_id, :tipo_de_pago_id, :_destroy ]
  )
end

def cuotas_params(params)
  if params[:pago].key?(:cuota_por_cliente_ids)
    ctas_ids = params.require(:pago).require(:cuota_por_cliente_ids)
    parametros = params.require(:pago).require(:cuotas_por_cliente_attributes).select do |index, cuota| 
      ctas_ids.include?(cuota[:id])
    end
    return parametros.to_a.map{|e| e[1]}  
  else
    return []
  end
end

class PagoTest < ActiveSupport::TestCase
  def pago_1
    params = ActionController::Parameters.new({
          "utf8"=>"✓", 
          "authenticity_token"=>"G7HsZDzOvszz6n1sbi59xxYnJYstHhot3h3BeS2MPTpVLlYAycynxAM98qedRbLwAu4LMrABbrlLV1gt7Ralig==", 
          "pago"=>{
            "persona_id"=> "14", 
            "cuenta_id"=>"5", 
            "proyecto_id"=>"5", 
            "cuotas_por_cliente_attributes"=>{"1"=>{"descuento_id"=>"1", "id"=>"18"}, "2"=>{"descuento_id"=>"", "id"=>"19"}, "3"=>{"descuento_id"=>"", "id"=>"20"}}, 
            "cuota_por_cliente_ids"=>["18"], 
            "pagos_metodos_attributes"=>{"1488151264316"=>{"tipo_de_pago_id"=>"1", "monto"=>"260", "_destroy"=>"false"}}
            }
          })
    puts pago_params(params)
    @pago = Pago.new(pago_params(params))
    @pago.update_descuentos_cuotas(cuotas_params(params))
    @pago
  end

  def pago_2
    params = ActionController::Parameters.new({
          "utf8"=>"✓", 
          "authenticity_token"=>"G7HsZDzOvszz6n1sbi59xxYnJYstHhot3h3BeS2MPTpVLlYAycynxAM98qedRbLwAu4LMrABbrlLV1gt7Ralig==", 
          "pago"=>{
            "persona_id"=>"14", 
            "cuenta_id"=>"5", 
            "proyecto_id"=>"5", 
            "cuotas_por_cliente_attributes"=>{"1"=>{"descuento_id"=>"1", "id"=>"18"}, "2"=>{"descuento_id"=>"", "id"=>"19"}, "3"=>{"descuento_id"=>"", "id"=>"20"}}, 
            "cuota_por_cliente_ids"=>[], 
            "pagos_metodos_attributes"=>{"1488151264316"=>{"tipo_de_pago_id"=>"1", "monto"=>"260", "_destroy"=>"false"}}
            }
          })
    puts pago_params(params)
    @pago = Pago.new(pago_params(params))
    @pago.update_descuentos_cuotas(cuotas_params(params))
    @pago
  end

  def pago_3
    params = ActionController::Parameters.new({
          "utf8"=>"✓", 
          "authenticity_token"=>"G7HsZDzOvszz6n1sbi59xxYnJYstHhot3h3BeS2MPTpVLlYAycynxAM98qedRbLwAu4LMrABbrlLV1gt7Ralig==", 
          "pago"=>{
            "persona_id"=>"14", 
            "cuenta_id"=>"5", 
            "proyecto_id"=>"5", 
            "cuotas_por_cliente_attributes"=>{"1"=>{"descuento_id"=>"1", "id"=>"18"}, "2"=>{"descuento_id"=>"", "id"=>"19"}, "3"=>{"descuento_id"=>"", "id"=>"20"}}, 
            "cuota_por_cliente_ids"=>["18"], 
            "pagos_metodos_attributes"=>{"1488151264316"=>{}}
            }
          })
    puts pago_params(params)
    @pago = Pago.new(pago_params(params))
    @pago.update_descuentos_cuotas(cuotas_params(params))
    @pago
  end

  def pago_4
    params = ActionController::Parameters.new({
          "utf8"=>"✓", 
          "authenticity_token"=>"G7HsZDzOvszz6n1sbi59xxYnJYstHhot3h3BeS2MPTpVLlYAycynxAM98qedRbLwAu4LMrABbrlLV1gt7Ralig==", 
          "pago"=>{
            "persona_id"=>"14", 
            "cuenta_id"=>"5", 
            "proyecto_id"=>"5", 
            "cuotas_por_cliente_attributes"=>{"1"=>{"descuento_id"=>"1", "id"=>"18"}, "2"=>{"descuento_id"=>"", "id"=>"19"}, "3"=>{"descuento_id"=>"", "id"=>"20"}}, 
            "cuota_por_cliente_ids"=>["18"], 
            "pagos_metodos_attributes"=>{"1488151264316"=>{"tipo_de_pago_id"=>"1", "monto"=>"230", "_destroy"=>"false"}}
            }
          })
    puts pago_params(params)
    @pago = Pago.new(pago_params(params))
    @pago.update_descuentos_cuotas(cuotas_params(params))
    @pago
  end

  #"tipo_de_pago_id"=>"1", "monto"=>"230", "_destroy"=>"false"
  def test_metodos_seleccionados
    if assert pago_4.valid? 
      puts "el pago es valido"
    end
  end

  def test_metodos_seleccionados
    assert_not pago_3, "debe seleccionar por lo menos 1 metodo de pago"
  end

  def test_cuotas_seleccionadas
    assert_raise ActionController::ParameterMissing do
      puts "hola"
      #pago_2
      # assert_not pago_2, "debe seleccionar por lo menos 1 cuota"
    end
  end

  def test_dinero_entregado
    assert pago_1.valid?, "el dinero entregado debe ser mayor o igual al monto a pagar"
  end
end
