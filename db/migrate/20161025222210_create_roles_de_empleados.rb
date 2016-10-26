class CreateRolesDeEmpleados < ActiveRecord::Migration
  def change
    create_table :roles_de_empleados do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
