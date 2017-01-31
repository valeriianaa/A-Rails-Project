require "test_helper"

class ConfiguracionTest < ActiveSupport::TestCase
  def configuracion
    @configuracion ||= Configuracion.new
  end

  def test_valid
    assert configuracion.valid?
  end
end
