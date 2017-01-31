class CreateConfiguraciones < ActiveRecord::Migration
  def change
    create_table :configuraciones do |t|
      t.string :logo
      t.string :nombre
      t.string :eslogan
      t.string :cuit
      t.string :condicion_iva
      t.datetime :plazo_abandono

      t.timestamps null: false
    end
  end
end
