require "test_helper"

class RolDeEmpleadoTest < ActiveSupport::TestCase
  def rol_de_empleado
    @rol_de_empleado ||= RolDeEmpleado.new
  end

  def test_valid
    assert rol_de_empleado.valid?
  end
end
