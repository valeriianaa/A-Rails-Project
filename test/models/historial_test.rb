require "test_helper"

class HistorialTest < ActiveSupport::TestCase
  def historial
    @historial ||= Historial.new
  end

  def test_valid
    assert historial.valid?
  end
end
