class AddProyectoRefToCuotaPorCliente < ActiveRecord::Migration
  def change
    add_reference :cuotas_por_cliente, :proyecto, index: true, foreign_key: true
  end
end
