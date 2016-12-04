class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :nombre
      t.boolean :ultimo
      t.integer :previous
      t.string :color

      t.timestamps null: false
    end
  end
end
