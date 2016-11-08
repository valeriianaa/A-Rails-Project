require "test_helper"

class PagoRealizadoTest < ActiveSupport::TestCase
  def pago_realizado
    @pago_realizado ||= PagoRealizado.new
  end

  def test_valid
    assert pago_realizado.valid?
  end
end
