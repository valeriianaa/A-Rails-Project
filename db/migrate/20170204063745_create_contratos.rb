class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.date :fecha_inicio
      t.date :fecha_fin

      t.timestamps null: false
    end
  end
end
