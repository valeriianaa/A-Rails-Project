class AddEstadoRefToActividadProyecto < ActiveRecord::Migration
  def change
    add_reference :actividades_proyectos, :estado, index: true, foreign_key: true
  end
end
