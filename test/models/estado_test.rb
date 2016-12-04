require "test_helper"

class EstadoTest < ActiveSupport::TestCase
  def estado
    @estado ||= Estado.new
  end

  def test_valid
    assert estado.valid?
  end
end
