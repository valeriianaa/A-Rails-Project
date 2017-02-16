require "test_helper"

class CuentaTest < ActiveSupport::TestCase
  def cuenta
    @cuenta ||= Cuenta.new
  end

  def test_valid
    assert cuenta.valid?
  end
end
