class AddProyectoRefToPago < ActiveRecord::Migration
  def change
    add_reference :pagos, :proyecto, index: true, foreign_key: true
  end
end
