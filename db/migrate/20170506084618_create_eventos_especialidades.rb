class CreateEventosEspecialidades < ActiveRecord::Migration
  def change
    create_table :eventos_especialidades do |t|

      t.timestamps null: false
    end
  end
end
