require "test_helper"

class CuotaPorClienteTest < ActiveSupport::TestCase
  def cuota_por_cliente
    @cuota_por_cliente ||= CuotaPorCliente.new
  end

  def test_valid
    assert cuota_por_cliente.valid?
  end
end
