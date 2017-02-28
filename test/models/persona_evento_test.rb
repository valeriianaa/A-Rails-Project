require "test_helper"

class PersonaEventoTest < ActiveSupport::TestCase
  def persona_evento
    @persona_evento ||= PersonaEvento.new
  end

  def test_valid
    assert persona_evento.valid?
  end
end
