class AddAreaRefToProyecto < ActiveRecord::Migration
  def change
    add_reference :proyectos, :area, index: true, foreign_key: true
  end
end
