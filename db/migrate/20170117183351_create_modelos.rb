class CreateModelos < ActiveRecord::Migration
  def change
    create_table :modelos do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
