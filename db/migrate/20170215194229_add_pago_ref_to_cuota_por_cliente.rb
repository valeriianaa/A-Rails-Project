class AddPagoRefToCuotaPorCliente < ActiveRecord::Migration
  def change
    add_reference :cuotas_por_cliente, :pago, index: true, foreign_key: true
  end
end
