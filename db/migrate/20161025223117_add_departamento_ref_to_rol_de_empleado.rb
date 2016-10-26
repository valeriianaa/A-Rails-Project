class AddDepartamentoRefToRolDeEmpleado < ActiveRecord::Migration
  def change
    add_reference :roles_de_empleados, :departamento, index: true, foreign_key: true
  end
end
