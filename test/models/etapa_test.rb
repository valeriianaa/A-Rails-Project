require "test_helper"

class EtapaTest < ActiveSupport::TestCase
  def etapa
    @etapa ||= Etapa.new
  end

  def test_valid
    assert etapa.valid?
  end
end
