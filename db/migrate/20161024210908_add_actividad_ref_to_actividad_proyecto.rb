class AddActividadRefToActividadProyecto < ActiveRecord::Migration
  def change
    add_reference :actividades_proyectos, :actividad, index: true, foreign_key: true
  end
end
