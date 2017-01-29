require "test_helper"

class ModeloTest < ActiveSupport::TestCase
  def modelo
    @modelo ||= Modelo.new
  end

  def test_valid
    assert modelo.valid?
  end
end
