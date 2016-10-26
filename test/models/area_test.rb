require "test_helper"

class AreaTest < ActiveSupport::TestCase
  def area
    @area ||= Area.new
  end

  def test_valid
    assert area.valid?
  end
end
