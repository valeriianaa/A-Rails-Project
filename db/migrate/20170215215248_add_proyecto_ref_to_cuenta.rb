class AddProyectoRefToCuenta < ActiveRecord::Migration
  def change
    add_reference :cuentas, :proyecto, index: true, foreign_key: true
  end
end
