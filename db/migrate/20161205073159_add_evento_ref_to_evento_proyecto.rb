class AddEventoRefToEventoProyecto < ActiveRecord::Migration
  def change
    add_reference :eventos_proyectos, :evento, index: true, foreign_key: true
  end
end
