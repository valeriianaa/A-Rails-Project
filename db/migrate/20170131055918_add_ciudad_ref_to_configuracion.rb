class AddCiudadRefToConfiguracion < ActiveRecord::Migration
  def change
    add_reference :configuraciones, :ciudad, index: true, foreign_key: true
  end
end
