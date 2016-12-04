class CreateDescuentos < ActiveRecord::Migration
  def change
    create_table :descuentos do |t|
      t.string :nombre
      t.text :descripcion
      t.float :porcentaje

      t.timestamps null: false
    end
  end
end
