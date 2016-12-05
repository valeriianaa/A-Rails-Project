class AddProyectoRefToEventoProyecto < ActiveRecord::Migration
  def change
    add_reference :eventos_proyectos, :proyecto, index: true, foreign_key: true
  end
end
