class AddProvinciaRefToCiudad < ActiveRecord::Migration
  def change
    add_reference :ciudades, :provincia, index: true, foreign_key: true
  end
end
