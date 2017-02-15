class AddConceptoDePagoRefToVencimiento < ActiveRecord::Migration
  def change
    add_reference :vencimientos, :concepto_de_pago, index: true, foreign_key: true
  end
end
