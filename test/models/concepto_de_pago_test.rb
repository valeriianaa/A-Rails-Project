require "test_helper"

class ConceptoDePagoTest < ActiveSupport::TestCase
  def concepto_de_pago
    @concepto_de_pago ||= ConceptoDePago.new
  end

  def test_valid
    assert concepto_de_pago.valid?
  end
end
