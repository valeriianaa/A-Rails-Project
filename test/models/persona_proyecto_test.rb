require "test_helper"

class PersonaProyectoTest < ActiveSupport::TestCase
  def persona_proyecto
    @persona_proyecto ||= PersonaProyecto.new
  end

  def test_valid
    assert persona_proyecto.valid?
  end
end
