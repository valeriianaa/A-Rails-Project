require "test_helper"

class ActividadProyectoTest < ActiveSupport::TestCase
  def actividad_proyecto
    @actividad_proyecto ||= ActividadProyecto.new
  end

  def test_valid
    assert actividad_proyecto.valid?
  end
end
