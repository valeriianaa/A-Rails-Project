class CreateIntereses < ActiveRecord::Migration
  def change
    create_table :intereses do |t|
      t.string :nombre
      t.text :descripcion
      t.float :porcentaje

      t.timestamps null: false
    end
  end
end
