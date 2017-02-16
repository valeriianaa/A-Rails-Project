require "test_helper"

class PagoMetodoTest < ActiveSupport::TestCase
  def pago_metodo
    @pago_metodo ||= PagoMetodo.new
  end

  def test_valid
    assert pago_metodo.valid?
  end
end
