class CreateActividades < ActiveRecord::Migration
  def change
    create_table :actividades do |t|
      t.string :nombre
      t.text :descripcion
      t.boolean :obligatorio

      t.timestamps null: false
    end
  end
end
