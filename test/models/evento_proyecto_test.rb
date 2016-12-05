require "test_helper"

class EventoProyectoTest < ActiveSupport::TestCase
  def evento_proyecto
    @evento_proyecto ||= EventoProyecto.new
  end

  def test_valid
    assert evento_proyecto.valid?
  end
end
