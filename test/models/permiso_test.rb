require "test_helper"

class PermisoTest < ActiveSupport::TestCase
  def permiso
    @permiso ||= Permiso.new
  end

  def test_valid
    assert permiso.valid?
  end
end
