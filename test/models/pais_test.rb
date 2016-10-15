require "test_helper"

class PaisTest < ActiveSupport::TestCase
  def pais
    @pais ||= Pais.new
  end

  def test_valid
    assert pais.valid?
  end
end
