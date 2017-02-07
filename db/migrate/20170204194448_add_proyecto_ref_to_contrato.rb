class AddProyectoRefToContrato < ActiveRecord::Migration
  def change
    add_reference :contratos, :proyecto, index: true, foreign_key: true
  end
end
