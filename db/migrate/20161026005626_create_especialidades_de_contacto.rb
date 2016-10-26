class CreateEspecialidadesDeContacto < ActiveRecord::Migration
  def change
    create_table :especialidades_de_contacto do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps null: false
    end
  end
end
