class AddEventoRefToEventoEspecialidad < ActiveRecord::Migration
  def change
    add_reference :eventos_especialidades, :evento, index: true, foreign_key: true
  end
end
