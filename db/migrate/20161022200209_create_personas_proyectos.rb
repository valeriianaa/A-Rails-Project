class CreatePersonasProyectos < ActiveRecord::Migration
  def change
    create_table :personas_proyectos do |t|

      t.timestamps null: false
    end
  end
end
