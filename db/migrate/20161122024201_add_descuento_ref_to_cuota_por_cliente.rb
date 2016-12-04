class AddDescuentoRefToCuotaPorCliente < ActiveRecord::Migration
  def change
    add_reference :cuotas_por_cliente, :descuento, index: true, foreign_key: true
  end
end
