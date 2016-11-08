class AddConceptoDePagoRefToContrato < ActiveRecord::Migration
  def change
    add_reference :contratos, :concepto_de_pago, index: true, foreign_key: true
  end
end
