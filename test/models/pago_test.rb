require "test_helper"

class PagoTest < ActiveSupport::TestCase
  def pago
    @pago ||= Pago.new
  end

  def test_valid
    assert pago.valid?
  end
end
