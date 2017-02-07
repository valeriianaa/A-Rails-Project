require "test_helper"

class ContratoTest < ActiveSupport::TestCase
  def contrato
    @contrato ||= Contrato.new
  end

  def test_valid
    assert contrato.valid?
  end
end
