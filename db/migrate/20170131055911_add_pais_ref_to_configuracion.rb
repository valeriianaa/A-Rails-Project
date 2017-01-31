class AddPaisRefToConfiguracion < ActiveRecord::Migration
  def change
    add_reference :configuraciones, :pais, index: true, foreign_key: true
  end
end
