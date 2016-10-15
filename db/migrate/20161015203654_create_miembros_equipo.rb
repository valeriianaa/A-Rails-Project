class CreateMiembrosEquipo < ActiveRecord::Migration
  def change
    create_table :miembros_equipo do |t|

      t.timestamps null: false
    end
  end
end
