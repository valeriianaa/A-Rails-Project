class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.float :interes
      t.float :descuento
      t.float :montoTotal

      t.timestamps null: false
    end
  end
end
