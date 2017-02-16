class AddCuentaRefToPago < ActiveRecord::Migration
  def change
    add_reference :pagos, :cuenta, index: true, foreign_key: true
  end
end
