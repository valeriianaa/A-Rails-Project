class AddAreaRefToConfiguracion < ActiveRecord::Migration
  def change
    add_reference :configuraciones, :area, index: true, foreign_key: true
  end
end
