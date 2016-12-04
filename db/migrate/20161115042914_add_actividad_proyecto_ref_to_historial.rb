class AddActividadProyectoRefToHistorial < ActiveRecord::Migration
  def change
    add_reference :historiales, :actividad_proyecto, index: true, foreign_key: true
  end
end
