class CreateSystemsettings < ActiveRecord::Migration
  def change
    create_table :systemsettings do |t|
      t.references :tipo_de_pago, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
