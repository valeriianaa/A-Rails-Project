require "test_helper"

class InteresTest < ActiveSupport::TestCase
  def interes
    @interes ||= Interes.new
  end

  def test_valid
    assert interes.valid?
  end
end
