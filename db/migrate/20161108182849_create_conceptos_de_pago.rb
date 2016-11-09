class CreateConceptosDePago < ActiveRecord::Migration
  def change
    create_table :conceptos_de_pago do |t|
      t.string :nombre
      t.text :descripcion
      t.float :monto
      t.date :fechaVencimiento
      t.date :plazoRecordatorio

      t.timestamps null: false
    end
  end
end