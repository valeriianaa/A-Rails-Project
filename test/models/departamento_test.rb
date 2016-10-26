require "test_helper"

class DepartamentoTest < ActiveSupport::TestCase
  def departamento
    @departamento ||= Departamento.new
  end

  def test_valid
    assert departamento.valid?
  end
end
