class CreateTiposDePago < ActiveRecord::Migration
  def change
    create_table :tipos_de_pago do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
