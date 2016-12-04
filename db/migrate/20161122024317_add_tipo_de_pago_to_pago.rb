class AddTipoDePagoToPago < ActiveRecord::Migration
  def change
    add_reference :pagos, :tipo_de_pago, index: true, foreign_key: true
  end
end
