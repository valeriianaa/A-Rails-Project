class AddProvinciaRefToConfiguracion < ActiveRecord::Migration
  def change
    add_reference :configuraciones, :provincia, index: true, foreign_key: true
  end
end
