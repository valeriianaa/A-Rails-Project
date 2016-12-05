class CreateEventosProyectos < ActiveRecord::Migration
  def change
    create_table :eventos_proyectos do |t|

      t.timestamps null: false
    end
  end
end
