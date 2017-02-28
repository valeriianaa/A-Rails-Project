class CreatePersonasEventos < ActiveRecord::Migration
  def change
    create_table :personas_eventos do |t|

      t.timestamps null: false
    end
  end
end
