require "test_helper"

class VencimientoTest < ActiveSupport::TestCase
  def vencimiento
    @vencimiento ||= Vencimiento.new
  end

  def test_valid
    assert vencimiento.valid?
  end
end
