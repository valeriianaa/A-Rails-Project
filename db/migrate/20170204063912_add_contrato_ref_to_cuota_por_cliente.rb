class AddContratoRefToCuotaPorCliente < ActiveRecord::Migration
  def change
    add_reference :cuotas_por_cliente, :contrato, index: true, foreign_key: true
  end
end
