class AddPersonaProyectoRefToContrato < ActiveRecord::Migration
  def change
    add_reference :contratos, :persona_proyecto, index: true, foreign_key: true
  end
end
