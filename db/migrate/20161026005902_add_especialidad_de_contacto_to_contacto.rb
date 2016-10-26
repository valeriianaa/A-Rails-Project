class AddEspecialidadDeContactoToContacto < ActiveRecord::Migration
  def change
    add_reference :contactos, :especialidad_de_contacto, index: true, foreign_key: true
  end
end
