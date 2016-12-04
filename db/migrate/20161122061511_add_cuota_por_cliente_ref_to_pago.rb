class AddCuotaPorClienteRefToPago < ActiveRecord::Migration
  def change
    add_reference :pagos, :cuota_por_cliente, index: true, foreign_key: true
  end
end
