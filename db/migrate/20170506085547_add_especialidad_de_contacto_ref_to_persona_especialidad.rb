class AddEspecialidadDeContactoRefToPersonaEspecialidad < ActiveRecord::Migration
  def change
    add_reference :personas_especialidades, :especialidad_de_contacto, index: true, foreign_key: true
  end
end
