class CreateConfiguraciones < ActiveRecord::Migration
  def change
    create_table :configuraciones do |t|
      t.string :logo
      t.string :nombre
      t.string :eslogan
      t.string :cuit
      t.string :condicion_iva
      t.integer :numero_abandono
      t.string :tiempo_abandono
      t.string :calle
      t.string :nro_domicilio
      t.string :piso
      t.string :dpto
      t.string :telefono
      t.string :email
      t.string :pag_web

      t.timestamps null: false
    end
  end
end
