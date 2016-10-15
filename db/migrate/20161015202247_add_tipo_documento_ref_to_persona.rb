class AddTipoDocumentoRefToPersona < ActiveRecord::Migration
  def change
    add_reference :personas, :tipo_documento, index: true, foreign_key: true
  end
end
