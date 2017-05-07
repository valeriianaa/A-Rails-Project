require "test_helper"

class EventoEspecialidadTest < ActiveSupport::TestCase
  def evento_especialidad
    @evento_especialidad ||= EventoEspecialidad.new
  end

  def test_valid
    assert evento_especialidad.valid?
  end
end
