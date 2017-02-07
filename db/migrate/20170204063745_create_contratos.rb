class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.date :fechaInicio
      t.date :fechaFin

      t.timestamps null: false
    end
  end
end
