require "test_helper"

class EmpleadoTest < ActiveSupport::TestCase
  def empleado
    @empleado ||= Empleado.new
  end

  def test_valid
    assert empleado.valid?
  end
end
