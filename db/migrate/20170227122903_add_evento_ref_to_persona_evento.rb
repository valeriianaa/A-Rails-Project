class AddEventoRefToPersonaEvento < ActiveRecord::Migration
  def change
    add_reference :personas_eventos, :evento, index: true, foreign_key: true
  end
end
