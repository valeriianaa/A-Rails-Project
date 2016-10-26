class AddProvinciaRefToProyecto < ActiveRecord::Migration
  def change
    add_reference :proyectos, :provincia, index: true, foreign_key: true
  end
end
