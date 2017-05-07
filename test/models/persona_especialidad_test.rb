require "test_helper"

class PersonaEspecialidadTest < ActiveSupport::TestCase
  def persona_especialidad
    @persona_especialidad ||= PersonaEspecialidad.new
  end

  def test_valid
    assert persona_especialidad.valid?
  end
end
