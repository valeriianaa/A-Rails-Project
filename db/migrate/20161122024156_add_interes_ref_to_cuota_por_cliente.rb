class AddInteresRefToCuotaPorCliente < ActiveRecord::Migration
  def change
    add_reference :cuotas_por_cliente, :interes, index: true, foreign_key: true
  end
end
