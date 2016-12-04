require "test_helper"

class TipoDePagoTest < ActiveSupport::TestCase
  def tipo_de_pago
    @tipo_de_pago ||= TipoDePago.new
  end

  def test_valid
    assert tipo_de_pago.valid?
  end
end
