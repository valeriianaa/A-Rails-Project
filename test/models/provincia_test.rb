require "test_helper"

class ProvinciaTest < ActiveSupport::TestCase
  def provincia
    @provincia ||= Provincia.new
  end

  def test_valid
    assert provincia.valid?
  end
end
