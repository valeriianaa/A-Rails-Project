class CreateTiposDePago < ActiveRecord::Migration
  def change
    create_table :tipos_de_pago do |t|
      t.string :nombre
      t.float :monto
      t.date :plazoInicio
      t.date :plazoFin

      t.timestamps null: false
    end
  end
end
