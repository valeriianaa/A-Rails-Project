require "test_helper"

class MiembroEquipoTest < ActiveSupport::TestCase
  def miembro_equipo
    @miembro_equipo ||= MiembroEquipo.new
  end

  def test_valid
    assert miembro_equipo.valid?
  end
end
