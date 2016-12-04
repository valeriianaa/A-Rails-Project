class AddPersonaProyectoRefToCuotaPorCliente < ActiveRecord::Migration
  def change
    add_reference :cuotas_por_cliente, :persona_proyecto, index: true, foreign_key: true
  end
end
