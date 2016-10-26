class AddProyectoRefToPersonaProyecto < ActiveRecord::Migration
  def change
    add_reference :personas_proyectos, :proyecto, index: true, foreign_key: true
  end
end
