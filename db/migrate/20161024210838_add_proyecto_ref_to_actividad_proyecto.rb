class AddProyectoRefToActividadProyecto < ActiveRecord::Migration
  def change
    add_reference :actividades_proyectos, :proyecto, index: true, foreign_key: true
  end
end
