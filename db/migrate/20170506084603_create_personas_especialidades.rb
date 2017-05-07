class CreatePersonasEspecialidades < ActiveRecord::Migration
  def change
    create_table :personas_especialidades do |t|

      t.timestamps null: false
    end
  end
end
