class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :nombre
      t.text :descripcion
      t.date :dia
      t.time :hora

      t.timestamps null: false
    end
  end
end
