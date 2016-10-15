require "test_helper"

class ActividadTest < ActiveSupport::TestCase
  def actividad
    @actividad ||= Actividad.new
  end

  def test_valid
    assert actividad.valid?
  end
end
