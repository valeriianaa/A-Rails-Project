class CreateHistoriales < ActiveRecord::Migration
  def change
    create_table :historiales do |t|
      t.datetime :fechaHora

      t.timestamps null: false
    end
  end
end
