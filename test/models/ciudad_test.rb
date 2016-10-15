require "test_helper"

class CiudadTest < ActiveSupport::TestCase
  def ciudad
    @ciudad ||= Ciudad.new
  end

  def test_valid
    assert ciudad.valid?
  end
end
