require "test_helper"

class AccionTest < ActiveSupport::TestCase
  def accion
    @accion ||= Accion.new
  end

  def test_valid
    assert accion.valid?
  end
end
