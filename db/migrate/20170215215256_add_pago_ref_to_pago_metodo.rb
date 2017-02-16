class AddPagoRefToPagoMetodo < ActiveRecord::Migration
  def change
    add_reference :pagos_metodos, :pago, index: true, foreign_key: true
  end
end
