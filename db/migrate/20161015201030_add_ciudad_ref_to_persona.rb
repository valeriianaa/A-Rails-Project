class AddCiudadRefToPersona < ActiveRecord::Migration
  def change
    add_reference :personas, :ciudad, index: true, foreign_key: true
  end
end
