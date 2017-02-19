require "test_helper"

class SystemsettingTest < ActiveSupport::TestCase
  def systemsetting
    @systemsetting ||= Systemsetting.new
  end

  def test_valid
    assert systemsetting.valid?
  end
end
