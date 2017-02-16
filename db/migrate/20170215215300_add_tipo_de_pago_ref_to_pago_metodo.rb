class AddTipoDePagoRefToPagoMetodo < ActiveRecord::Migration
  def change
    add_reference :pagos_metodos, :tipo_de_pago, index: true, foreign_key: true
  end
end
