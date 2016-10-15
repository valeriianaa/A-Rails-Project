class CreateCiudades < ActiveRecord::Migration
  def change
    create_table :ciudades do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
