require "test_helper"

class DescuentoTest < ActiveSupport::TestCase
  def descuento
    @descuento ||= Descuento.new
  end

  def test_valid
    assert descuento.valid?
  end
end
