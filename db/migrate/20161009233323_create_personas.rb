class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :nombre
      t.string :apellido
      t.string :nroIdentificacion
      t.string :fechaNacimiento
      t.string :direccion
      t.string :telefono
      t.string :email
      t.string :type

      t.timestamps null: false
    end
  end
end
