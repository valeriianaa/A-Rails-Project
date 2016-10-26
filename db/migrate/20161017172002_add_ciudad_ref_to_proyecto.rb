class AddCiudadRefToProyecto < ActiveRecord::Migration
  def change
    add_reference :proyectos, :ciudad, index: true, foreign_key: true
  end
end
