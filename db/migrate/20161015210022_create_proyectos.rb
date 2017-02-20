class CreateProyectos < ActiveRecord::Migration
  def change
    create_table :proyectos do |t|
      t.string :codigo
      t.string :nombre
      t.text :descripcion
      t.string :calle
      t.string :nroDomicilio
      t.string :piso
      t.string :dpto
      t.string :telefono
      t.string :email
      t.string :pagWeb

      t.timestamps null: false
    end
  end
end
