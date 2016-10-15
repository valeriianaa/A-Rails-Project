class CreateEtapas < ActiveRecord::Migration
  def change
    create_table :etapas do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps null: false
    end
  end
end
