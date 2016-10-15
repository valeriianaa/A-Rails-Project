class AddPaisRefToCiudad < ActiveRecord::Migration
  def change
    add_reference :ciudades, :pais, index: true, foreign_key: true
  end
end
