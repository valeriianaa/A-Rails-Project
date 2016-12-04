class AddRolDeEmpleadoRefToPersona < ActiveRecord::Migration
  def change
    add_reference :personas, :rol_de_empleado, index: true, foreign_key: true
  end
end
