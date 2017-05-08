class AddContratoRefToPago < ActiveRecord::Migration
  def change
    add_reference :pagos, :contrato, index: true, foreign_key: true
  end
end
