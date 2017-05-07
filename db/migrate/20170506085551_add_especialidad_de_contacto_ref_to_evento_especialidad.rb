class AddEspecialidadDeContactoRefToEventoEspecialidad < ActiveRecord::Migration
  def change
    add_reference :eventos_especialidades, :especialidad_de_contacto, index: true, foreign_key: true
  end
end
