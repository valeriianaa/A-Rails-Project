class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :codigo
      t.string :nombre
      t.string :apellido
      t.string :nroIdentificacion
      t.date :fechaNacimiento
      t.string :calle
      t.string :nroDomicilio
      t.string :piso
      t.string :dpto
      t.string :telefono
      t.string :email
      t.string :tipo
      t.string :type

      t.timestamps null: false
    end
  end
end
