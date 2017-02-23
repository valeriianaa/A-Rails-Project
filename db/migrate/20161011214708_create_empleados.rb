class CreateEmpleados < ActiveRecord::Migration
  def change
    create_table :empleados do |t|
    

      t.timestamps null: false
    end
  end
end
