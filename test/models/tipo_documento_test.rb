require "test_helper"

class TipoDocumentoTest < ActiveSupport::TestCase
  def tipo_documento
    @tipo_documento ||= TipoDocumento.new
  end

  def test_valid
    assert tipo_documento.valid?
  end
end
