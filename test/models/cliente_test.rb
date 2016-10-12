require "test_helper"

class ClienteTest < ActiveSupport::TestCase
  def cliente
    @cliente ||= Cliente.new
  end

  def test_valid
    assert cliente.valid?
  end
end
