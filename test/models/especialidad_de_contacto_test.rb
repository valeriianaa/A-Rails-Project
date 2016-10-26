require "test_helper"

class EspecialidadDeContactoTest < ActiveSupport::TestCase
  def especialidad_de_contacto
    @especialidad_de_contacto ||= EspecialidadDeContacto.new
  end

  def test_valid
    assert especialidad_de_contacto.valid?
  end
end
