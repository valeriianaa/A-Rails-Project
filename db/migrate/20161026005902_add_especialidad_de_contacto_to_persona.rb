class AddEspecialidadDeContactoToPersona < ActiveRecord::Migration
  def change
    add_reference :personas, :especialidad_de_contacto, index: true, foreign_key: true
  end
end
