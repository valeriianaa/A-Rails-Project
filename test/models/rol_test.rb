require "test_helper"

class RolTest < ActiveSupport::TestCase
  def rol
    @rol ||= Rol.new
  end

  def test_valid
    assert rol.valid?
  end
end
